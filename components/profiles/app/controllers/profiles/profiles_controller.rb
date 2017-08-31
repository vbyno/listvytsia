module Profiles
  class ProfilesController < ::Core::ApplicationController
    respond_to :json

    helper_method :profile, :profiles

    def index; end
    def create; end

    def update
      profile.update_attributes(profile_params)
    end

    def destroy
      profile.destroy
    end

    private

    def profile_params
      params.require(:profile).permit(:link, :address, :title, :phone, :price, :published)
    end

    def profiles
      @profiles ||= params[:published] ? policy_scope(Profile).published : policy_scope(Profile)
    end

    def profile
      @profile ||= params[:id] ? Profile.find(params[:id]) : Profile.create(profile_params)
    end
  end
end
