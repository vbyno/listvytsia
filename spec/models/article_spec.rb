require 'spec_helper'

describe Article, type: :model do
  it { is_expected.to belong_to(:author).of_type(User).as_inverse_of(:articles) }
end
