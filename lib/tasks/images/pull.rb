module Tasks
  module Images
    class Pull < Base
      include RunnableViaConsole

      def call
        runner.(copy_uploads.squish)
      end

      private

      def copy_uploads
        <<-EOF
          scp -P #{ config.server_port }
              -r #{ config.server_user }@#{ config.server_ip }:#{ server_uploads_folder }
                 #{ local_public_folder }
        EOF
      end

      def server_uploads_folder
        "/var/www/apps/#{ config.application_name }/current/public/uploads"
      end

      def local_public_folder
        "#{ Listvytsia::Application.root }/public/"
      end
    end
  end
end
