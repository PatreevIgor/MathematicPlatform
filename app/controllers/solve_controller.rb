class SolveController < ApplicationController
  def solve_equation
    @html_block = html_block(params)
    @result_in_html = html_generator_presenter.present(prepare_result(params))

    respond_to :js
  end

  private

  def html_block(params)
    quadratic_equation_type?(params) ? '.quadratic_result' : '.linear_result'
  end

  def quadratic_equation_type?(params)
    params[:c].present?
  end

  def html_generator_presenter
    @html_generator_presenter ||= HtmlGeneratorPresenter.new
  end

  def prepare_result(params)
    if quadratic_equation_type?(params)
      equation_solver.solve_quadratic_equation(params)
    else
      equation_solver.solve_linear_equation(params)
    end
  end

  def equation_solver
    @equation_solver ||= EquationSolver.new
  end
end
