require 'spec_helper'

describe Core::UserDecorators::User do
  describe '#permitted_to?' do
    let(:role_1) { create :role }
    let(:role_2) { create :role }
    let(:user) { create :user }
    let(:user_decorator) { described_class.new(user) }
    subject(:permitted_to) { user_decorator.permitted_to?(:update, :articles) }

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
