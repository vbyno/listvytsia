require 'spec_helper'

describe Liqpay::PaymentService do
  let(:amount) { "102.50" }
  let(:host) { 'local.example.com' }
  let(:port) { 3000 }
  let(:protocol) { "http://" }
  let(:result_url) { "#{protocol}#{host}:#{port}/donate" }
  let(:server_url) { "#{protocol}#{host}:#{port}/liqpay/execute" }
  let(:donation) { create :donation, amount: amount.to_f }
  let(:request) { double(host: host, optional_port: port, protocol: protocol,
                         path_parameters: {:controller=>"donations", :action=>"create"}) }
  let(:controller) do
    ctrl = Liqpay::PaymentsController.new
    allow(ctrl).to receive(:request).and_return request

    ctrl
  end

  let(:payment_service) { described_class.new(donation, controller) }

  describe '#liqpay_request' do
    delegate :liqpay_request, to: :payment_service

    it ' generates liqpay request by donation' do
      expect(liqpay_request.amount).to eq amount
      expect(liqpay_request.order_id).to eq donation.id.to_s
      expect(liqpay_request.currency).to eq 'UAH'
      expect(liqpay_request.result_url).to eq result_url
      expect(liqpay_request.server_url).to eq server_url
      expect(liqpay_request.description).to eq 'Добровільна пожертва'
    end
  end
end
