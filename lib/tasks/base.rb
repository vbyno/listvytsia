module Tasks
  class Base
    def self.to_proc
      proc { |*args| call(*args) }
    end

    def self.call(*args)
      new(*args).call
    end

    attr_reader :task, :arguments

    def initialize(task, arguments, **_)
      @task = task
      @arguments = arguments
    end

    def call
      raise NotImplementedError
    end
  end
end
