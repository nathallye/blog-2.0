Rails.application.routes.draw do
  resources :tags
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#home' #Faz com que rota inicial da aplicação seja a pag home 
end
