class RolesController < ApplicationController
  helper_method :roles, :role

  def index; end
  def show; end
  def edit; end

  def new
    @role ||= Role.new
  end

  def create
    if role.save
      redirect_to edit_role_path(role), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if role.update_attributes(role_params)
      redirect_to edit_role_path(role.reload), notice: t('.success')
    else
      render :edit
    end
  end

  private

  def roles
    @roles ||= Role.scoped
  end

  def role
    @role ||= params[:id] ? roles.find(params[:id]) : roles.new(role_params)
  end

  def role_params
    params.require(:role).permit(:title, permissions_attributes: [:id, :resource_identifier,
                                                                  :action_identifier, :_destroy])
  end
end