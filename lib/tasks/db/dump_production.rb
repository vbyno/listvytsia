module Tasks
  module DB
    class DumpProduction < Base
      include RunnableViaConsole

      def call
        puts 'Dump on production database...'

        runner.(make_external_directory.squish) &&
          runner.(mongodump.squish) &&
          runner.(make_local_directory.squish) &&
          runner.(copy_into_local_directory.squish) &&
          runner.(remove_external_directory.squish)

        puts 'Done!'
      end

      private

      def make_external_directory
        "#{ via_ssh } mkdir -p #{ dumpfolder }"
      end

      def make_local_directory
        "mkdir -p #{ local_dumpfolder }"
      end

      def mongodump
        <<-EOF
          #{ via_ssh } mongodump --db #{ config.database_name }
                                 --port #{ config.database_port }
                                 --out #{ dumpfolder }
        EOF
      end

      def copy_into_local_directory
        <<-EOF
          scp -P #{ config.server_port }
              -r #{ config.server_user }@#{ config.server_ip }:#{ dumpfolder }
                 #{ local_dumpfolder }
        EOF
      end

      def remove_external_directory
        "#{ via_ssh } -p #{ config.server_port } rm -rf #{ dumpfolder }"
      end

      def str_date
        time.strftime("%Y_%m_%d")
      end

      def local_dumpfolder
        "#{ Listvytsia::Application.root }/tmp/dump/"
      end

      def via_ssh
        "ssh #{ config.server_user }@#{ config.server_ip } -p #{ config.server_port }"
      end

      def dumpfolder
        "/home/#{ config.server_user }/dump/#{ str_date }"
      end
    end
  end
end
