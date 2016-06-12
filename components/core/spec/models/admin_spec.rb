require 'spec_helper'

describe Core::Admin, type: :model do
  it { is_expected.to validate_presence_of(:email) }
end
