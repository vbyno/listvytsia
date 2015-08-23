class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  layout 'admin'
end