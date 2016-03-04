require 'spec_helper'

describe Section, model: true do
  it { is_expected.to have_many(:articles).as_inverse_of(:section) }

  it { is_expected.to validate_presence_of(:title) }
end
