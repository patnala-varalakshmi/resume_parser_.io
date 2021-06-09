Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
  root :to => 'resumes#index'

  resources :resumes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
