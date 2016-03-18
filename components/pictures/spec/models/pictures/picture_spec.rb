require 'spec_helper'

describe Pictures::Picture do
  it { expect(subject).to validate_presence_of :apartment }

  # Because of this issue we can't do this with uploaders
  # https://github.com/thoughtbot/shoulda-matchers/issues/479
  specify 'data field validation' do
    expect(subject).to_not be_valid
  end
end
