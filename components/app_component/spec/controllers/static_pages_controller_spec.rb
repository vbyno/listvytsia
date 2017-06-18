require 'spec_helper'

describe AppComponent::StaticPagesController, type: :controller do
  routes { AppComponent::Engine.routes }

  describe 'GET donate' do
    let!(:donation) { create :donation }
    let(:valid_params) { { donation_id: donation.id } }
    let(:invalid_params) { { donation_id: '100500' } }
    let(:confirmed_message) { I18n.t('app_component.static_pages.donate.confirmed') }
    let(:not_confirmed_message) { I18n.t('app_component.static_pages.donate.not_confirmed') }

    before { allow_any_instance_of(::Liqpay::Response).to receive(:decode!).and_return true }

    context 'donation is paid' do
      let!(:donation) { create :donation, paid: true }

      it 'displays successful notice' do
        get :donate, params: valid_params

        expect(flash[:notice]).to eq confirmed_message
      end

      it 'displays nothing' do
        get :donate, params: invalid_params

        expect(flash[:notice]).to be_nil
        expect(flash[:error]).to be_nil
      end
    end

    context 'donation is unpaid' do
      let!(:donation) { create :donation, paid: false }

      it 'displays successful notice' do
        get :donate, params: valid_params

        expect(flash[:error]).to eq not_confirmed_message
      end

      it 'displays nothing' do
        get :donate, params: invalid_params

        expect(flash[:notice]).to be_nil
        expect(flash[:error]).to be_nil
      end
    end
  end
end
