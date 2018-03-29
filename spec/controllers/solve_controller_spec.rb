require 'rails_helper'

RSpec.describe SolveController, type: :controller do
  before do
    allow_any_instance_of(described_class).to receive(:equation_solver).and_return(equation_solver)
    allow_any_instance_of(described_class).to receive(:equation_solving_result_presenter).and_return(equation_solving_result_presenter)
  end
  let(:equation_solver) { double(:equation_solver, solve_equation: 'result') }
  let(:equation_solving_result_presenter) { double(:equation_solving_result_presenter, present: 'result') }

  describe '#solve_equation' do
    let(:params) { { type: 'linear', a: 1, b: 2 } }

    it 'receives send_request method' do
      expect(equation_solver).to receive(:solve_equation)

      post :solve_equation, params: params, xhr: true
    end

    it 'receives send_request method' do
      expect(equation_solving_result_presenter).to receive(:present)

      post :solve_equation, params: params, xhr: true
    end
  end
end
