class EquationSolver
  def solve_equation(params)
    # binding.pry
    quadratic_equation_type?(params) ? solve_quadratic_equation(params) : solve_linear_equation(params)
  end

  private

  def quadratic_equation_type?(params)
    params[:c].present?
  end

  def solve_quadratic_equation(params)
    result     = request_sender.send_request(quadratic_equation_params(params))['result']
    html_block = '.quadratic_result'

    [html_block, result]
  end

  def solve_linear_equation(params)
    result     = request_sender.send_request(linear_equation_params(params))['result']
    html_block = '.linear_result'

    [html_block, result]
  end

  def request_sender
    @request_sender ||= RequestSender.new
  end

  def quadratic_equation_params(params)
    full_params     = { type: 'quadratic' }
    full_params[:a] = params['a'].to_f
    full_params[:b] = params['b'].to_f
    full_params[:c] = params['c'].to_f

    full_params
  end

  def linear_equation_params(params)
    full_params     = { type: 'linear' }
    full_params[:a] = params['a'].to_f
    full_params[:b] = params['b'].to_f

    full_params
  end
end
