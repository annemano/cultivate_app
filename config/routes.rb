Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries

  namespace :guided do
   resources :entries, only: [:new, :create] # GET /guided/entries/new && POST /guided/entries
  end

  resources :youtube, only: :show

  get "/menu", to: 'pages#menu', as: 'menu'
  post "/entries/mood", to: 'entries#set_mood'
end
