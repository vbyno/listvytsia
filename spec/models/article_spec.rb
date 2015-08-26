require 'spec_helper'

describe Article, type: :model do
  it { is_expected.to belong_to(:author).of_type(User).as_inverse_of(:articles) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:permalink) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:published) }
  it { is_expected.to validate_presence_of(:author) }

  it { is_expected.to validate_uniqueness_of(:permalink) }

  describe '#author?' do
    let(:user) { build :user }
    let(:other_user) { build :user }
    let(:article) { build :article, author: user }

    delegate :author?, to: :article

    it 'is falsey if user is nil' do
      expect(author?(nil)).to be_falsey
    end

    it 'is falsey if user is not equal author' do
      expect(author?(other_user)).to be_falsey
    end

    it 'is truthy' do
      expect(author?(user)).to be_truthy
    end
  end
end
