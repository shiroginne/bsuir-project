Bsuir::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  namespace :admin do
    resource :home, :only => :show
    resources :users

    root :to => 'homes#show'
  end
end
