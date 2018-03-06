Rails.application.routes.draw do
  root to: 'main#index'

  resources :solve do
    collection do
      post :solve_linear_equation
      post :solve_quadratic_equation
    end
  end
end
