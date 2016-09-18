module Chunks
  module Admins
    class ChunksController < Core::Admins::BaseController
      respond_to :json
      helper_method :chunks, :chunk

      def index; end
      def show; end

      def create
        chunk.save
      end

      def update
        chunk.update_attributes(chunk_params)
      end

      def destroy
        chunk.destroy
      end

      private

      def chunks
        @chunks ||= Chunks::Chunk.all
      end

      def chunk
        @chunk ||= params[:id] ? chunks.find(params[:id]) : chunks.new(chunk_params)
      end

      def chunk_params
        params.require(:chunk).permit(:body, :identifier)
      end
    end
  end
end
