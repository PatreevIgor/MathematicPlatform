require 'rails_helper'

RSpec.describe SolveController, type: :controller do
  before { allow_any_instance_of(described_class).to receive(:request_sender).and_return(request_sender) }
  let(:request_sender) { double(:request_sender, send_request: 'result') }

  describe '#solve_equation' do
    let(:params) { { type: 'linear', a: 1, b: 2 } }

    xit 'receives send_request method' do
      expect(request_sender).to receive(:send_request)

      post :solve_equation, params: params, xhr: true
    end
  end
end
