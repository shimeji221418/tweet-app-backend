Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    namespace 'v1' do
        get 'users/current' => 'users#current'
      resources :users, only: [:index, :show, :update, :destroy]
      resources :posts 
      resources :likes, only: [:create, :destroy]
          get 'likes' => 'likes#likes_by'
          get 'likes/count' => 'likes#likes_count'
        namespace 'auth' do
          post 'registrations' => 'registrations#create'
        end
      end
    end
end
