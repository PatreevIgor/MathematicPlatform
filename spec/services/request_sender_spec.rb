require 'rails_helper'

describe RequestSender do
  subject { described_class.new }

  describe '#send_request' do
    context 'send linear equation params' do
      let(:params) { { type: 'linear', a: 1, b: 2 } }
      let(:result) { { 'result' => -2.0, 'code' => 0 } }

      it 'returns result' do
        expect(subject.send_request(params)).to eq(result)
      end
    end

    context 'send quadratic equation params' do
      let(:params) { { type: 'quadratic', a: 1, b: 2, c: -3 } }
      let(:result) { { 'result' => [1.0, -3.0], 'code' => 0 } }

      it 'returns result' do
        expect(subject.send_request(params)).to eq(result)
      end
    end
  end
end
