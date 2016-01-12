require 'spec_helper'

describe Liqpay::PaymentService do
  let(:amount) { "102.50" }
  let(:host) { 'local.example.com' }
  let(:port) { 3000 }
  let(:protocol) { "http://" }
  let(:result_url) { "#{protocol}#{host}:#{port}/donate" }
  let(:server_url) { "#{protocol}#{host}:#{port}/donations/confirm" }
  let(:donation) { create :donation, amount: amount.to_f }
  let(:http_request) { double(host: host, optional_port: port, protocol: protocol,
                              path_parameters: {:controller=>"donations", :action=>"create"}) }
  let(:controller) do
    ctrl = ApplicationController.new
    allow(ctrl).to receive(:request).and_return http_request

    ctrl
  end

  let(:payment_service) { described_class.new(donation, controller) }

  describe '#request' do
    delegate :request, to: :payment_service

    it ' generates liqpay request by donation' do
      expect(request.amount).to eq amount
      expect(request.order_id).to eq donation.id.to_s
      expect(request.currency).to eq 'UAH'
      expect(request.result_url).to eq result_url
      expect(request.server_url).to eq server_url
      expect(request.description).to eq 'Добровільна пожертва'
    end
  end
end
