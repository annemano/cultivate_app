Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Entries
  resources :entries

  # Guided entries
  namespace :guided do
   resources :entries, only: [:new, :create] # GET /guided/entries/new && POST /guided/entries
  end

  # Embed youtube and spotify links in entries
  resources :youtube, only: :show
  resources :spotify, only: :show

  # Communities
  resources :communities
  resources :communities, only: :show do
    resources :messages, only: %i[create destroy]
  end

  resources :community_members, only: :destroy

  # Community requests
  get "/community_requests", to: 'community_requests#decide', as: :decide

  # Mood
  get "/menu", to: 'pages#menu', as: 'menu'
  post "/menu/mood", to: 'pages#set_mood'

  # Doodle
  get "/doodle", to: 'pages#doodle'

  # Sharing entries
  get "/entries/:id/:community_id/share", to: 'entries#share', as: 'entry_share'
end
