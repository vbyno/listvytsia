module MicroGroups
  class MicroGroupsController < ::Core::ApplicationController
    respond_to :json

    helper_method :micro_group, :micro_groups

    def index; end
    def create; end

    def update
      micro_group.update_attributes(micro_group_params)
    end

    def destroy
      micro_group.destroy
    end

    private

    def micro_group_params
      params.require(:micro_group).permit(:link, :address, :title, :phone, :price, :published)
    end

    def micro_groups
      @micro_groups ||= params[:published] ? policy_scope(MicroGroup).published : policy_scope(MicroGroup)
    end

    def micro_group
      @micro_group ||= params[:id] ? MicroGroup.find(params[:id]) : MicroGroup.create(micro_group_params)
    end
  end
end
