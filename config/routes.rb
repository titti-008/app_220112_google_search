Rails.application.routes.draw do
  get 'static_pages/home'
  root "static_pages#home"
  get "/search", to: "static_pages#show"
end
