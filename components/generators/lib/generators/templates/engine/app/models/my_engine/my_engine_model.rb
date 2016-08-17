module <%= name %>
  class <%= name.singularize %>
    include Mongoid::Document
    include Mongoid::Timestamps
  end
end
