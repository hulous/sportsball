AppComponent::Engine.routes.draw do
  resources :teams
  root to: "welcome#index"
end
