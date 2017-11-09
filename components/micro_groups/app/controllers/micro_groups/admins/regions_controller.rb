module MicroGroups
  module Admins
    class RegionsController < Core::Admins::BaseController
      respond_to :json
      helper_method :regions, :region

      def index; end
      def show; end

      def create
        region.save
      end

      def update
        region.update_attributes(region_params)
      end

      def destroy
        region.destroy
      end

      private

      def regions
        @regions ||= Region.all
      end

      def region
        @region ||= params[:id] ? regions.find(params[:id]) : regions.new(region_params)
      end

      def region_params
        params.require(:region).permit(*Region::ATTRIBUTES)
      end
    end
  end
end
