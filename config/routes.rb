Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'search', to: 'search#new', as: 'new_search'
  # get '/email-confirm', to: 'public/home#email_confirm'
  # get '/beta-success', to: 'public/home#beta_success'
  # get '/newsletter-success', to: 'public/home#newsletter_success'

  # get '/beta', to: 'public/home#beta_signup'
  
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  get '/sitemap.xml.gz', to: redirect('https://s3.amazonaws.com/tolenno-assets/sitemap.xml.gz')

  # authenticated :user do
  #   root 'search#show', as: :authenticated_root
  # end

  root to: 'public/home#index'
end
