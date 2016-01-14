require 'spec_helper'

describe DonationsController do
  describe 'POST confirm' do
    let(:amount) { 12 }
    let(:donation) { create :donation, amount: amount }
    let(:params) { { status:'success',
                     order_id: donation.id,
                     amount: amount.to_s }.with_indifferent_access }
    let(:confirmed_message) { I18n.t('donations.confirm.confirmed') }
    let(:invalid_order_id_error) { I18n.t('activemodel.errors.models.liqpay/responder.attributes.base.invalid_order_id') }

    before { allow_any_instance_of(Liqpay::Response).to receive(:decode!).and_return true }

    it 'redirects and displays flash message' do
      post :confirm, params

      expect(flash[:notice]).to eq confirmed_message
    end

    it 'redirects and displays flash error' do
      post :confirm, params.merge(order_id: '100500')

      expect(flash[:error]).to eq not_confirmed_message(invalid_order_id_error)
    end

    def not_confirmed_message(error)
      I18n.t('donations.confirm.not_confirmed', error: error)
    end
  end
end
