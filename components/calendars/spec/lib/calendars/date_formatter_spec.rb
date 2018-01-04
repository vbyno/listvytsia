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
      expect(to_period(Time.new(2011, 03, 19), Time.new(2011, 03, 20))).to eq '19 - 20.03.2011'
    end

    specify do
      expect(to_period(Time.new(2011, 03, 17), Time.new(2011, 04, 02))).to eq '17.03 - 2.04.2011'
    end

    specify do
      expect(to_period(Time.new(2010, 03, 19), Time.new(2011, 03, 20))).to eq '19.03.2010 - 20.03.2011'
    end
  end

  describe '.treat_as_utc' do
    delegate :treat_as_utc, to: :described_class

    specify do
      expect(treat_as_utc('2018-01-04T22:00:00.000Z')).to eq Time.utc(2018, 01, 05, 00)
      expect(treat_as_utc('2018-02-06T02:00:00.000Z')).to eq Time.utc(2018, 02, 06, 04)
    end
  end
end
