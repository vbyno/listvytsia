require 'spec_helper'

describe Chunks::Chunk, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
