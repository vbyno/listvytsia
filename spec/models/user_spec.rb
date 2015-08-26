require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many(:articles).as_inverse_of(:author).with_autosave }
  it { is_expected.to have_and_belong_to_many(:roles).with_autosave }

  describe '#permitted_to?' do
    let(:role_1) { create :role }
    let(:role_2) { create :role }
    let(:user) { build :user }
    subject(:permitted_to) { user.permitted_to?(:update, :articles) }

    before do
      role_1.permissions.build(action: 'create', resource: 'articles')
      role_2.permissions.build(action: 'update', resource: 'articles')
    end

    it 'is falsey is user has no roles' do
      expect(permitted_to).to be_falsey
    end

    it 'is falsey if user has not appropriate permission' do
      user.roles << role_1

      expect(permitted_to).to be_falsey
    end

    it 'return true if has permissions' do
      user.roles << role_2

      expect(permitted_to).to be_truthy
    end
  end
end
