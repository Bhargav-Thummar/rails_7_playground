Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: "pages#home"
  # root "quotes#index"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :quotes do
    resources :comments

    resources :line_item_dates, except: [:index, :show]
  end
end
