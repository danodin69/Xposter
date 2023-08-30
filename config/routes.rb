Rails.application.routes.draw do
  get "about", to: "about#index", as: :about

  get "sign_up",to: "registrations#new", as: :sign_up
  post "sign_up", to: "registrations#create"

  get "sign_in",to: "sessions#new", as: :sign_in
  post "sign_in", to: "sessions#create"


  get "edit_password", to: "passwords#edit", as: :edit_password
  patch "edit_password", to: "passwords#update"

  delete "logout", to: "sessions#destroy", as: :logout

  get "edit_password/reset", to: "password_resets#new"
  post "edit_password/reset", to: "password_resets#create"
  
  get "edit_password/reset/edit", to: "password_resets#edit"
  patch "edit_password/reset/edit", to: "password_resets#update"


  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"
  root to: "main#index"

end
