describe Calendars::DateFormatter do
  describe '.to_day_and_month' do
    delegate :to_day_and_month, to: :described_class

    specify { expect(to_day_and_month(Time.new(2011, 01, 02))).to eq '2 січня' }
    specify { expect(to_day_and_month(Time.new(2011, 03, 19))).to eq '19 березня' }
    specify { expect(to_day_and_month(Time.new(2011, 12, 29))).to eq '29 грудня' }
  end

  describe '.to_period' do
    delegate :to_period, to: :described_class

    specify do
      expect(to_period(Time.new(2011, 03, 17), Time.new(2011, 04, 02))).
        to eq '17 березня - 2 квітня'
    end

    specify do
      expect(to_period(Time.new(2011, 03, 19), Time.new(2011, 03, 20))).
        to eq '19 - 20 березня'
    end
  end
end
