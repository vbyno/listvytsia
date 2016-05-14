require 'spec_helper'

describe AppComponent::Admin, type: :model do
  it { is_expected.to validate_presence_of(:email) }
end
