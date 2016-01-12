require 'spec_helper'

describe Donation, model: true do
  let(:donation) { build :donation, amount: 56 }

  it { is_expected.to monetize(:amount) }

  it 'sets amount of money' do
    expect(donation.amount.to_s).to eq '56.00'
    expect(donation.amount.cents).to eq 5600
    expect(donation.amount.fractional).to eq 5600
    expect(donation.amount.currency.to_s).to eq "UAH"
  end

  describe 'validations' do
    it 'does not allow to set zero amount' do
      donation.amount = 0

      expect(donation).not_to be_valid
    end

    it 'does not allow to set string' do
      donation.amount = 'eweww'

      expect(donation).not_to be_valid
    end
  end
end
