Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/posts/' ,to:"posts#index"
  #put "posts/:id", to: 'posts#index' , as: :update_post
  resources :posts do
    resources :comments
  end
   get "posts/:id", to: 'posts#show' , as: :show_post
  root to: 'posts#index'  #specifies to which action the default path will go to
  #root to: 'posts#index' is equal to this line => get '/', to: 'posts#index', as: :root 

end
