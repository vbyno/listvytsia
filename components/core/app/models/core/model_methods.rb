module Core
  module ModelMethods
    extend ActiveSupport::Concern

    class_methods do
      def human_list_name
        model_name.human(count: Float::INFINITY)
      end
    end
  end
end
