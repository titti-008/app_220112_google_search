Rails.application.routes.draw do

  root to: "search#home"
  get "/search", to: "search#show"


end
