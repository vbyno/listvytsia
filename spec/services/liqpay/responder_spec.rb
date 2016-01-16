require 'spec_helper'

describe Liqpay::Responder do
  let(:donation) { create :donation }
  let(:params) { { order_id: donation.id.to_s,
                   status: 'success',
                   amount: donation.amount.to_s }.with_indifferent_access }
  let(:responder) { described_class.new(params) }

  before { allow_any_instance_of(Liqpay::Response).to receive(:decode!).and_return true }

  describe '#confirm' do
    delegate :confirm, to: :responder

    it 'updates paid attribute' do
      expect { confirm }.to change { donation.reload.paid }.from(false).to(true)
    end

    it 'does not update paid attribute' do
      params.merge!(amount: '222')

      expect { confirm }.not_to change { donation.reload.paid }
    end
  end
end
