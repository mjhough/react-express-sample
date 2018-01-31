Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/home#index'
  post 'search', to: 'public/search#new', as: 'new_search'
end
