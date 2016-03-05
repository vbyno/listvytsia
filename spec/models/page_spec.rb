require 'spec_helper'

describe Page, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:permalink) }
  it { is_expected.to validate_presence_of(:published) }

  it { is_expected.to validate_uniqueness_of(:permalink) }
end
