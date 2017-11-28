Rails.application.routes.draw do
  root 'static_pages#index'

  get '/todos/completed', to: 'todos#completed', as: 'search1'
  get '/todos/not_completed', to: 'todos#not_completed', as: 'search2'

  patch '/todos/id/check/', to: 'todos#check_complete', as: 'check_complete'

  resources :todos
end
