def sign_in_as(email:, password:)
  visit '/users/sign_in' unless current_path == '/users/sign_in'

  expect(page).to have_content 'Log in'

  fill_in 'Електронна адреса', with: email
  fill_in 'Password', with: password

  click_button 'Log in'
end