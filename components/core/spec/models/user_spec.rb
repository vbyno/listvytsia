require 'spec_helper'

describe Core::User, type: :model do
  it { is_expected.to have_and_belong_to_many(:roles).with_autosave }
end
