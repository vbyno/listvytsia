require 'spec_helper'

describe Hotels::Hotel, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :phone }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :address }
end
