class SolveController < ApplicationController
  def solve_equation
    solving_result  = equation_solver.solve_equation(params)
    @result_in_html = equation_solving_result_presenter.present(solving_result)

    respond_to :js
  end

  private

  def equation_solving_result_presenter
    @equation_solving_result_presenter ||= EquationSolvingResultPresenter.new
  end

  def equation_solver
    @equation_solver ||= EquationSolver.new
  end
end
