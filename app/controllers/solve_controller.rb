class SolveController < ApplicationController
  def solve_equation
    quadratic_equation?(params) ? respond_quadratic_result : respond_linear_result
  end

  private

  def quadratic_equation?(params)
    params[:c].present?
  end

  def respond_quadratic_result
    @quadratic_result = quadratic_result

    if quadratic_result.is_a?(Array)
      respond_two_roots
    elsif !convert_to_i(quadratic_result).nil?
      respond_one_root
    else
      respond_invalid_quadratic_result
    end
  end

  def respond_two_roots
    @x1 = @quadratic_result.first
    @x2 = @quadratic_result.last

    respond_to do |format|
      format.js { render action: 'valid_quadratic_result_two_roots.js.erb' }
    end
  end

  def convert_to_i(str)
    Integer(str)
  rescue ArgumentError
    nil
  end

  def quadratic_result
    request_sender.send_request(quadratic_equation_params(params))['result']
  end

  def quadratic_equation_params(params)
    full_params     = { type: 'quadratic' }
    full_params[:a] = params['a'].to_f
    full_params[:b] = params['b'].to_f
    full_params[:c] = params['c'].to_f

    full_params
  end

  def respond_one_root
    respond_to do |format|
      format.js { render action: 'valid_quadratic_result_one_root.js.erb' }
    end
  end

  def respond_invalid_quadratic_result
    respond_to do |format|
      format.js { render action: 'invalid_quadratic_result.js.erb' }
    end
  end

  def respond_linear_result
    @linear_result = linear_result
    respond_to do |format|
      format.js { render action: 'linear_result.js.erb' }
    end
  end

  def linear_result
    request_sender.send_request(linear_equation_params(params))['result']
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
