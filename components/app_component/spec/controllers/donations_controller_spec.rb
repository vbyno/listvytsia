require 'spec_helper'

describe AppComponent::DonationsController, type: :controller do
  routes { AppComponent::Engine.routes }

  describe 'POST confirm' do
    let(:params) { {} }

    it 'invokes liqpay_responder' do
      expect_any_instance_of(AppComponent::Liqpay::Responder).to receive(:confirm)

      post :confirm, params
    end
  end
end
