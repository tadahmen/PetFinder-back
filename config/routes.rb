Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
      resources :pets#, :users
      post "users/login" => "users#check_login"
  end

end
