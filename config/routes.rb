Bsuir::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  namespace :admin do
    resource :home, :only => :show
    resources :users
    resources :faculties
    resources :specialities
    resources :groups

    root :to => 'homes#show'
  end
end
