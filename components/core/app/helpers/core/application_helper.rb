module Core
  module ApplicationHelper
    def present(object, presenter_class = nil)
      presenter_class ||= "#{object.class}Presenter".safe_constantize || Core::BasePresenter

      presenter = presenter_class.new(object, self)

      yield(presenter) if block_given?
      presenter
    end
  end
end
