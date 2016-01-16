require 'spec_helper'

describe DonationsController do
  describe 'POST confirm' do
    let(:params) { {} }

    it 'invokes liqpay_responder' do
      expect_any_instance_of(Liqpay::Responder).to receive(:confirm)

      post :confirm, params
    end
  end
end
