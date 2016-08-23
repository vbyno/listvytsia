require 'spec_helper'

describe AppComponent::ArticlePolicy do
  let(:user) { build :user }
  let(:registered_user) { build :user }
  let(:user_decorator) { Core::UserDecorators::User.new(registered_user) }
  let(:article) { build :article, author: user }
  let(:policy) { described_class.new(user_decorator, article) }

  describe '#show?' do
    subject { policy.show? }

    it { is_expected.to be_truthy }

    context 'article is unpublished' do
      let(:article) { build :article, published: false, author: user }

      it { is_expected.to be_falsey }

      context 'current user is an author' do
        let(:article) { build :article, published: false, author_id: registered_user.id }

        it { is_expected.to be_truthy }
      end
    end
  end
end
