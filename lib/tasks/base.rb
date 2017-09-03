module Tasks
  class Base
    def call
      raise NotImplementedError
    end

    def to_proc
      proc { call }
    end
  end
end
