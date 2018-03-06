class SolveController < ApplicationController
  def solve_linear_equation
    @linear_result = request_sender.send_request(linear_equation_params(params))

    respond_to do |format|
      format.js { @linear_result }
    end
  end

  def solve_quadratic_equation
    @quadratic_result = request_sender.send_request(quadratic_equation_params(params))

    respond_to do |format|
      format.js { @quadratic_result }
    end
  end

  private

  def linear_equation_params(params)
    full_params     = { type: 'linear' }
    full_params[:a] = params['a'].to_f
    full_params[:b] = params['b'].to_f

    full_params
  end

  def quadratic_equation_params(params)
    full_params     = { type: 'quadratic' }
    full_params[:a] = params['a'].to_f
    full_params[:b] = params['b'].to_f
    full_params[:c] = params['c'].to_f

    full_params
  end

  def request_sender
    @request_sender ||= RequestSender.new
  end
end
