Rails.application.routes.draw do
  resources :personal_data do
    resources :employments
  end

  root "personal_data#index"
end
