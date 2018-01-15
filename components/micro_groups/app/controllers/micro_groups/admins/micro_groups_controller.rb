module MicroGroups
  module Admins
    class MicroGroupsController < Core::Admins::BaseController
      respond_to :json
      helper_method :micro_groups, :micro_group

      def index; end
      def show; end

      def create
        micro_group.save
      end

      def update
        micro_group.update_attributes(micro_group_params)
      end

      def destroy
        micro_group.destroy
      end

      private

      def micro_groups
        @micro_groups ||= MicroGroups::MicroGroup.all
      end

      def micro_group
        @micro_group ||= params[:id] ? micro_groups.find(params[:id]) : micro_groups.new(micro_group_params)
      end

      def micro_group_params
        params.require(:micro_group).
               permit(*MicroGroup::ATTRIBUTES,
                      permissions_attributes: [:id, :_destroy])
      end
    end
  end
end
