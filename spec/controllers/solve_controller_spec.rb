require 'rails_helper'

RSpec.describe SolveController, type: :controller do
  before { allow_any_instance_of(described_class).to receive(:request_sender).and_return(request_sender) }

  describe '#button_solve_linear_equation' do
    let(:request_sender) { double(:request_sender, send_request: result) }
    let(:result) { 'some result' }
    let(:params) { { type: 'linear', a: 1, b: 2 } }

    it 'receives send_request method and redirect to root_path' do
      expect(request_sender).to receive(:send_request)
      post :button_solve_linear_equation, params: params

      expect(response).to redirect_to(root_path(linear_result: result))
    end
  end
end
