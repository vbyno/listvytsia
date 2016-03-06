require 'spec_helper'

describe SeoContent, type: :model do
  it { is_expected.to be_embedded_in(:page) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }

  xit { is_expected.to validate_length_of(:title).within(20..70) }
  xit { is_expected.to validate_length_of(:description).within(50..160) }
end
