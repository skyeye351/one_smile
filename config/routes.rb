Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: %i[new create]
  # ネストすることで関連するリソースの関係が明確になる。
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit update destroy], shallow: true
  end
  resource :profile, only: %i[show edit update]

  get "welcome/index"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
end
