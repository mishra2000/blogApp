Rails.application.routes.draw do
  get 'blogs/myblogs'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles
  
end
