Rails.application.routes.draw do
  resources :events, except: %i[show]
end
