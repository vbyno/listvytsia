module Tasks
  module DB
    class RestoreStaging < Base
      include RunnableViaConsole

      def call
        puts 'importing production database dump into staging...'

        runner.(make_external_directory) &&
          runner.(copy_into_remote_directory.squish) &&
          runner.(restore_staging_database.squish) &&
          runner.(remove_external_directory.squish)

        puts 'Done!'
      end

      private

      def make_external_directory
        "#{ via_ssh } mkdir -p #{ dumpfolder }"
      end

      def dumpfolder
        "/home/#{ config.server_user }/dump/#{ name_of_latest_local_dumpfolder }"
      end

      def name_of_latest_local_dumpfolder
        File.basename(latest_local_dumpfolder)
      end

      def latest_local_dumpfolder
        Dir[Listvytsia::Application.root.join('tmp', 'dump', '*')].last
      end

      def copy_into_remote_directory
        <<-EOF
          scp -P #{ config.server_port }
              -r #{ latest_local_dumpfolder }/#{ config.database_name }
                 #{ config.server_user }@#{ config.server_ip }:#{ dumpfolder }
        EOF
      end

      def restore_staging_database
        <<-EOF
          #{ via_ssh } mongorestore --db listvytsia_staging
                                    --port #{ config.database_port }
                                    --verbose
                                    --drop
                                    #{ dumpfolder }/#{ config.database_name }
        EOF
      end

      def remove_external_directory
        "#{ via_ssh } rm -rf #{ dumpfolder }"
      end

      def via_ssh
        "ssh #{ config.server_user }@#{ config.server_ip } -p #{ config.server_port }"
      end
    end
  end
end
