require 'integration_helper'

describe 'create event', js: true do
  let(:user) { create :user }

  before do
    allow_any_instance_of(AppComponent::EventPolicy).to receive(:create?).and_return true
    allow_any_instance_of(AppComponent::EventPolicy).to receive(:update?).and_return true
  end

  it 'creates' do
    login_as(user)

    visit '/events/new'

    fill_in 'Заголовок', with: 'Подія 1'
    fill_in 'Посилання', with: 'podiya_1'
    fill_in 'Ввідний текст', with: 'Чудова стаття, написана хорошим автором'

    click_button 'Зберегти'
    expect(page).to have_error 'Контент не може бути пустим'

    fill_in_ckeditor 'event_content', with: 'Наповнення статті'

    click_button 'Зберегти'
    expect(page).to have_notice 'Подія успішно створена'

    click_link 'Подія 1'
    click_link 'Редагувати подію'
    click_link 'Фотографії'
    click_link 'Додати фотографії'
    attach_file('ok', Rails.root.join('spec', 'support', 'fixtures', 'image.jpeg'))
    page.attach_file "images", ['path to file1.jpg', 'pathto file2.jpg' ,'pathtofile3.JPG']
  end
end
