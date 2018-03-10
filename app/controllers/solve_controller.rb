class SolveController < ApplicationController
  def solve_equation
    quadratic_equation?(params) ? respond_quadratic_result(params) : respond_linear_result
  end

  private

  def respond_quadratic_result(params)
    @quadratic_result = result_calculator.quadratic_result(params)

    if result_calculator.quadratic_result(params).is_a?(Array)
      respond_two_roots
    elsif !result_calculator.convert_to_i(result_calculator.quadratic_result(params)).nil?
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
    @linear_result = result_calculator.linear_result(params)
    respond_to do |format|
      format.js { render action: 'linear_result.js.erb' }
    end
  end

  def quadratic_equation?(params)
    params[:c].present?
  end

  def result_calculator
    @result_calculator ||= ResultCalculator.new
  end
end
