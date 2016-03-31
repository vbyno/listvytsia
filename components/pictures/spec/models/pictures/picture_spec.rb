require 'spec_helper'

describe Pictures::Picture, type: :model  do
  describe '.by_page_id' do
    let!(:picture_1) { create :picture, page_id: 'page-1' }
    let!(:picture_2) { create :picture, page_id: 'page-2' }

    subject(:pictures) { described_class.by_page_id('page-1') }

    it 'returns filtered pictures' do
      expect(pictures).to eq [picture_1]
    end
  end

  it { is_expected.to validate_presence_of :data }
  it { is_expected.to validate_presence_of :page_id }

  # Because of this issue we can't do this with uploaders
  # https://github.com/thoughtbot/shoulda-matchers/issues/479
  specify 'data field validation' do
    expect(subject).to_not be_valid
  end
end
