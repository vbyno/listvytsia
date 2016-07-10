require 'integration_helper'

describe 'sign-in user', js: true do
  let(:password) { 'Strong_Pa$$word123' }
  let(:user) { create :user, password: password }

  context 'user has permission and valid' do
    it 'loads sign-in page' do
      # sign_in_as(email: '', password: '')

      # expect(page).to have_alert 'Invalid email or password.'
      # expect(page).to have_current_path new_user_session_path, only_path: true

      # sign_in_as(email: user.email, password: 'wrong_password')

      # expect(page).to have_alert 'Invalid email or password.'
      # expect(page).to have_current_path new_user_session_path, only_path: true

      sign_in_as(email: user.email, password: password)

      expect(page).to have_notice 'Вхід успішний'
      expect(page).to have_current_path core.root_path, only_path: true
    end
  end
end
