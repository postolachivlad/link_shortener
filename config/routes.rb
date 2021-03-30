Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  post '/links', to: 'links#create'
  get '/:url_short_code', to: 'links#show'
end
