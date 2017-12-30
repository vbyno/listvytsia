describe Calendars::DateFormatter do
  describe '.call' do
    specify { expect(described_class.call(Time.new(2011, 01, 02))).to eq '2 січня' }
    specify { expect(described_class.call(Time.new(2011, 03, 19))).to eq '19 березня' }
    specify { expect(described_class.call(Time.new(2011, 12, 29))).to eq '29 грудня' }
  end
end
