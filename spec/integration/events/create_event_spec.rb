require 'integration_helper'

describe 'create event', js: true do
  let(:user) { create :user }

  before do
    allow_any_instance_of(EventPolicy).to receive(:create?).and_return true
  end

  it 'creates' do
    login_as(user)

    visit '/events/new'

    click_link 'Seo Content'

    fill_in 'SEO-заголовок', with: 'Seo-заголовок цієї чудової сторінки'
    fill_in 'SEO-опис', with: 'Seo-опис сторінки'
  end
end
