module MicroGroups
  class RegionsController < Core::ApplicationController
    helper_method :regions, :region

    def index; end
    def show; end

    private

    def regions
      @regions ||= policy_scope(Region).order(priority: :desc)
    end

    def region
      @region ||= begin
        region = regions.find(params[:id])

        authorize(region)

        region
      end
    end
  end
end
