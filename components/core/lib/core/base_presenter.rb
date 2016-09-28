module Core
  class BasePresenter < SimpleDelegator
    delegate :t, :present, to: :h

    def self.presents(name)
      define_method(name) do
        @model
      end
    end

    def initialize(model, view)
      @model = model
      @view = view

      super(@model)
    end

    def h
      @view
    end

    def id
      @model.id.to_s
    end
  end
end
