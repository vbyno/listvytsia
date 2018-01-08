module MicroGroups
  class RegionsController < Core::ApplicationController
    helper_method :region, :micro_groups

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

    def micro_groups
      @micro_groups ||= MicroGroup.all
    end
  end
end
