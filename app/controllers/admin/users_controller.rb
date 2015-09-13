class Admin::UsersController < Admin::BaseController
  respond_to :json
  helper_method :users, :user

  def index; end
  def show; end
  def edit; end

  def new
    @user ||= User.new
  end

  def create
    if user.save
      redirect_to admin_users_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if user.update_attributes(user_params)
      redirect_to admin_users_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    redirect_to :back, notice: (user.destroy ? t('.success') : t('.fail'))
  end

  private

  def users
    @users ||= User.scoped
  end

  def user
    @user ||= params[:id] ? users.find(params[:id]) : users.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, role_ids: [])
  end
end