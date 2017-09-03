module Tasks
  class CommandRunner
    def call(command)
      system(command)
    end
  end
end
