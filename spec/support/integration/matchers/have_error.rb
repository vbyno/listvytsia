RSpec::Matchers.define :have_error do |text, *args|
  match do |actual|
    Capybara.string(page.body).has_selector?('div#flash_error', text: text)
  end

  failure_message do |actual|
    "expected that current page with path `#{ actual.current_path }` would have error with text: `#{ text }`"
  end

  failure_message_when_negated do |actual|
    "expected that current page with path `#{ actual.current_path }` would not have error with text `#{ text }`"
  end

  description do
    "has error with text `#{ text }`"
  end
end
