require 'rails_helper'

describe EquationSolver do
  subject { described_class.new }

  describe '#solve_equation' do
    context 'solve linear equation with one root' do
      let(:params) { { a: 1, b: 2 } }
      let(:result) { ['.linear_result', -2.0] }

      it 'returns result' do
        expect(subject.solve_equation(params)).to eq(result)
      end
    end

    context 'solve linear equation with two roots' do
      let(:params) { { type: 'linear', a: 1, b: 2 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve linear equation with infinity solutions' do
      let(:params) { { type: 'linear', a: 1, b: 2 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve linear equation without solutions' do
      let(:params) { { type: 'linear', a: 1, b: 2 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve quadratic equation with one root' do
      let(:params) { { type: 'quadratic', a: 1, b: 2, c: -3 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve quadratic equation with two roots' do
      let(:params) { { type: 'quadratic', a: 1, b: 2, c: -3 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve quadratic equation with infinity solutions' do
      let(:params) { { type: 'quadratic', a: 1, b: 2, c: -3 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end

    context 'solve quadratic equation without solutions' do
      let(:params) { { type: 'quadratic', a: 1, b: 2, c: -3 } }
      # let(:result) { { 'result' => -2.0, 'code' => 0 } }

      # it 'returns result' do
      #   expect(subject.send_request(params)).to eq(result)
      # end
    end
  end
end
