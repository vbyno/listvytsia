RSpec::Matchers.define :have_alert do |text, *args|
  match do |actual|
    Capybara.string(page.body).has_selector?('span.alert.icon', text: text)
  end

  failure_message do |actual|
    "expected that current page with path `#{ actual.current_path }` would have alert with text: `#{ text }`"
  end

  failure_message_when_negated do |actual|
    "expected that current page with path `#{ actual.current_path }` would not have alert with text `#{ text }`"
  end

  description do
    "has alert with text `#{ text }`"
  end
end
