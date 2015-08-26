require 'spec_helper'

describe ArticlePolicy do
  let(:user) { build :user }
  let(:current_user) { build :user }
  let(:article) { build :article, author: user }
  let(:policy) { described_class.new(current_user, article) }

  describe '#show?' do
    subject { policy.show? }

    it { is_expected.to be_truthy }

    context 'article is unpublished' do
      let(:article) { build :article, published: false, author: user }

      it { is_expected.to be_falsey }

      context 'current user is an author' do
        let(:article) { build :article, published: false, author: current_user }

        it { is_expected.to be_truthy }
      end
    end
  end
end
