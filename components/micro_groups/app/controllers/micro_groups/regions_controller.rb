module MicroGroups
  class RegionsController < Core::ApplicationController
    helper_method :regions, :region

    def show; end

    private

    def regions
      @regions ||= policy_scope(Region).order(priority: :desc)
    end

    def region
      @region ||=
        regions.find_by!(permalink: params[:permalink]).tap do |_region|
          authorize(_region)
        end
    end
  end
end
