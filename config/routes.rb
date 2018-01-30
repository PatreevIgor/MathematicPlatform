Rails.application.routes.draw do
  root to: 'main#index'

  resources :solve do
    collection do
      post :button_solve_linear_equation
      post :button_solve_quadratic_equation
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
