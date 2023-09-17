Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/books/:id" => "books#show"
  delete "books/:id" => "books#destroy"
  resources :publishers, only: %i{show edhit update}

  resource :profile

  # resources :publishers do
  #   #入れ子のリソースになる　publishers/:publisher_id/books
  #   resources :books
  #   #個別のリソースに対してアクション
  #   member do
  #     get 'detail'
  #   end
  #   #全体のリソースに対してアクション
  #   collection do
  #     get 'search'
  #   end
  # end
end
