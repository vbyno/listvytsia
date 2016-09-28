module Chunks
  class Chunk
    include Mongoid::Document
    include Mongoid::Timestamps
    include Core::ModelMethods

    field :identifier
    field :body

    validates :identifier, :body, presence: true
  end
end
