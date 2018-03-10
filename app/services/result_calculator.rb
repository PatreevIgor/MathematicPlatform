class ResultCalculator
  def quadratic_result(params)
    request_sender.send_request(quadratic_equation_params(params))['result']
  end

  def linear_result(params)
    request_sender.send_request(linear_equation_params(params))['result']
  end

  def convert_to_i(str)
    Integer(str)
  rescue ArgumentError
    nil
  end

  private

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

  def request_sender
    @request_sender ||= RequestSender.new
  end
end
