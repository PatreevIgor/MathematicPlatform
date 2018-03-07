Rails.application.routes.draw do
  root to: 'main#index'

  resources :solve do
    collection do
      post :solve_equation
    end
  end
end
