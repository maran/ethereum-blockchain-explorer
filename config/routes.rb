Rails.application.routes.draw do

  resources :addresses
  resources :transactions
  resources :blocks do
    resources :transactions
  end

  root to: "blocks#index"
end
