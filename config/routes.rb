Rails.application.routes.draw do
  root 'users#index'

  resources :users

  # ресурс сессий (только три экшена :new, :create, :destroy)
  resources :sessions, only: [:new, :create, :destroy]

  # ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]

  #  синонимы путей - в дополнение к созданным в ресурсах выше
  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
  get 'delete_account' => 'users#destroy'
end
