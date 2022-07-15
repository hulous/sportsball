# This migration comes from app_component (originally 20220706195507)
class CreateAppComponentGamesAppComponent < ActiveRecord::Migration[6.0]
  def change
    create_table :app_component_games, if_not_exists: true do |t|
      t.datetime :date
      t.string :location
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :winning_team
      t.integer :first_team_score
      t.integer :second_team_score

      t.timestamps
    end
  end
end
