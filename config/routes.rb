Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/home#index'
  post 'search', to: 'public/search#new', as: 'new_search'
  get '/email-confirm', to: 'public/home#email_confirm'
  get '/beta-success', to: 'public/home#beta_success'
  get '/newsletter-success', to: 'public/home#newsletter_success'
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  get '/sitemap.xml.gz', to: redirect('https://s3-us-east-1.amazonaws.com/tolenno/sitemap.xml.gz')
end
