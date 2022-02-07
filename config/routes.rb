Rails.application.routes.draw do
  devise_for :users, defaults: { formats: :json },
            controllers: {
              sessions: 'users/sessions',
              registrations: 'users/registrations'
            }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :products
      resources :suppliers
    end
  end
end
