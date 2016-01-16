class Base
  def self.human_list_name
    model_name.human(count: Float::INFINITY)
  end
end