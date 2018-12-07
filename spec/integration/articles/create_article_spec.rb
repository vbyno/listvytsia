require 'integration_helper'

xdescribe 'create article', js: true do
  let(:user) { create :user }

  before do
    allow_any_instance_of(AppComponent::ArticlePolicy).to receive(:create?).and_return true
    allow_any_instance_of(AppComponent::ArticlePolicy).to receive(:update?).and_return true
  end

  it 'creates' do
    login_as(user)

    visit '/articles/new'

    fill_in 'Заголовок', with: 'Стаття 1'
    fill_in 'Посилання', with: 'stattya_1'
    fill_in 'Ввідний текст', with: 'Чудова стаття, написана хорошим автором'

    click_button 'Зберегти'
    expect(page).to have_error 'Контент не може бути пустим'

    fill_in_ckeditor 'article_content', with: 'Наповнення статті'

    click_button 'Зберегти'
    expect(page).to have_notice 'Стаття успішно створена'

    click_link 'Стаття 1'
    expect(page).to have_text 'Наповнення статті'
    expect(page.current_path).to eq '/articles/stattya_1'

    click_link 'Редагувати статтю'
    check 'Опублікувати'
    click_button 'Зберегти'

    expect(page).to have_error 'Seo content не може бути пустим'

    click_on 'Seo Content'
    fill_in 'SEO-заголовок', with: 'Seo-заголовок цієї чудової сторінки'

    click_button 'Зберегти'

    expect(page).to have_error 'Seo content недійсний'

    click_on 'Seo Content'
    fill_in 'SEO-опис', with: 'Seo-опис сторінки'
    click_button 'Зберегти'

    expect(page).to have_notice 'Стаття успішно оновлена'
  end
end
