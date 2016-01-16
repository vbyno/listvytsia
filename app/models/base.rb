class Base
  include Mongoid::Document

  scope :by_id, ->(id) { where(id: id) }

  def self.human_list_name
    model_name.human(count: Float::INFINITY)
  end
end