Rails.application.routes.draw do
  root to: 'main#index'

  resources :solve do
    collection do
      post :button_solve_linear_equation
      post :button_solve_quadratic_equation
    end
  end
end
