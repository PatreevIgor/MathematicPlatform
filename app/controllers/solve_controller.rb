class SolveController < ApplicationController
  def button_solve_linear_equation
    params_with_type = { type: 'linear' }
    params_with_type[:a] = params['a'].to_f
    params_with_type[:b] = params['b'].to_f
    result = request_sender.send_request(params_with_type)
  end

  def button_solve_quadratic_equation
  end

  def request_sender
    @request_sender ||= RequestSender.new
  end
end
