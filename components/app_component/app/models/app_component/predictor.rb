module AppComponent
  class Predictor #< ApplicationRecord
    def initialize(teams)
      @teams_lookup = teams.inject({}) do |memo, team|
        memo[team.id] = {
          team: team,
          rating: [Saulabs::TrueSkill::Rating.new(1_500.0, 1_000.0, 1.o)]
        }

        memo
      end
    end

    def learn(games)
      games.each do |game|
        first_team_rating = @teams_lookup[game.first_team_id][:rating]
        second_team_rating = @teams_lookup[game.second_team_id][:rating]
        game_result = game.winning_team == 1 ? [first_team_rating, second_team_rating] : [second_team_rating, first_team_rating]

        Saulabs::TrueSkill::FactorGraph.new(game_result, [1, 2]).update_skills
      end
    end

    def predict(first_team, second_team)
      team_1 = @teams_lookup[first_team.id][:team]
      team_2 = @teams_lookup[second_team.id][:team]
      winner = higher_mean_team(first_team, second_team) ? team_1 : team_2

      AppComponent::Prediction.new(team_1, team_2, winner)
    end

    def higher_mean_team(first_team, second_team)
      @teams_lookup[first_team.id][:rating].first.mean > @teams_lookup[second_team.id][:rating].first.mean
    end
  end
end
