module Tasks
  module RunnableViaConsole
    attr_reader :runner, :config, :time

    def initialize(*args,
                   runner: CommandRunner.new,
                   config: OpenStruct.new(YAML.load_file('config/application.yml').
                                                   fetch('production')),
                   time: Time.now)
      super

      @runner = runner
      @config = config
      @time = time
    end
  end
end
