Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/home#index'
  post 'search', to: 'public/search#new', as: 'new_search'
  get '/email-confirm', to: 'public/home#email_confirm'
  get '/beta-success', to: 'public/home#beta_success'
  get '/newsletter-success', to: 'public/home#newsletter_success'
end
