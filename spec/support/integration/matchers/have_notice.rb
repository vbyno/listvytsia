RSpec::Matchers.define :have_notice do |text, *args|
  match do |actual|
    Capybara.string(page.body).has_selector?('div#flash_notice', text: text)
  end

  failure_message do |actual|
    "expected that current page with path `#{ actual.current_path }` would have notice with text: `#{ text }`"
  end

  failure_message_when_negated do |actual|
    "expected that current page with path `#{ actual.current_path }` would not have notice with text `#{ text }`"
  end

  description do
    "has notice with text `#{ text }`"
  end
end
