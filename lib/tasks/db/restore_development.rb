module Tasks
  module DB
    class RestoreDevelopment < Base
      include RunnableViaConsole

      def call
        puts 'importing production database to development database...'

        runner.(command.squish)

        puts 'Done!'
      end

      private

      def command
        <<-EOF
          mongorestore --db listvytsia_development --drop #{ dumpfolder }/#{ config.database_name }
        EOF
      end

      def dumpfolder
        "#{ Listvytsia::Application.root }/tmp/dump/#{ str_date }"

        "/data/db/dump/#{ str_date }"
      end

      def str_date
        time.strftime("%Y_%m_%d")
      end
    end
  end
end
