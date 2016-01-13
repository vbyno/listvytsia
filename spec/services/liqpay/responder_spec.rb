require 'spec_helper'

describe Liqpay::Responder do
  let(:donation) { create :donation }
  let(:params) { { order_id: donation.id.to_s, status: 'success' }.with_indifferent_access }
  let(:responder) { described_class.new(params) }

  before { allow_any_instance_of(Liqpay::Response).to receive(:decode!).and_return true }

  describe '#donation' do
    it 'returns donation' do
      expect(responder.donation).to eq donation
    end
  end

  describe '#valid?' do
    delegate :errors, to: :responder
    let(:invalid_order_id) { I18n.t('activemodel.errors.models.liqpay/responder.attributes.base.invalid_order_id') }
    let(:donation_is_already_paid) { I18n.t('activemodel.errors.models.liqpay/responder.attributes.base.donation_is_already_paid') }
    let(:incorrect_amount) { I18n.t('activemodel.errors.models.liqpay/responder.attributes.base.incorrect_amount') }

    it 'adds invalid_order_id error' do
      params[:order_id] = '100500'

      expect(responder).not_to be_valid
      expect(errors[:base]).to include invalid_order_id
    end
  end
end
