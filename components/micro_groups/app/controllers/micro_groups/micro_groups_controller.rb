module MicroGroups
  class MicroGroupsController < Core::ApplicationController
    helper_method :micro_groups, :micro_group

    def index; end
    def show; end

    private

    def micro_groups
      @micro_groups ||= policy_scope(MicroGroup).ordered_by_priority
    end

    def micro_group
      @micro_group ||= begin
        micro_group = micro_groups.find_by(permalink: params[:permalink])

        authorize(micro_group)

        micro_group
      end
    end
  end
end
