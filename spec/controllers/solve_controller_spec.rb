require 'rails_helper'

RSpec.describe SolveController, type: :controller do
  before { allow_any_instance_of(described_class).to receive(:request_sender).and_return(request_sender) }
  let(:request_sender) { double(:request_sender, send_request: result) }
  let(:result) { 'some result' }

  describe '#solve_linear_equation' do
    let(:params) { { type: 'linear', a: 1, b: 2 } }

    it 'receives send_request method and redirect to root_path' do
      expect(request_sender).to receive(:send_request)

      post :solve_linear_equation, params: params, xhr: true
    end
  end

  describe '#solve_quadratic_equation' do
    let(:params) { { type: 'linear', a: 1, b: 2, c: -5 } }

    it 'receives send_request method' do
      expect(request_sender).to receive(:send_request)

      post :solve_quadratic_equation, params: params, xhr: true
    end
  end
end
