Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :users do
    resources :gifts
  end
  # resources :wishlistitems, :path => "MyWishListItems"
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
