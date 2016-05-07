module AppComponent
  module Concerns
    module ModelMethods
      extend ActiveSupport::Concern

      module ClassMethods
        def human_list_name
          model_name.human(count: Float::INFINITY)
        end
      end
    end
  end
end
