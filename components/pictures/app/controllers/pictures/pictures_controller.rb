require_dependency 'pictures/application_controller'

module Pictures
  class PicturesController < ApplicationController
    respond_to :json

    helper_method :picture

    def index
      @pictures = Picture.by_page_id(params[:page_id])
    end

    def create; end

    def update
      picture.update_attributes(picture_params)
    end

    private

    def picture_params
      params.require(:picture).permit(:page_id, :alt, :title, :data)
    end

    def picture
      @picture ||= params[:id] ? Picture.find(params[:id]) : Picture.create(picture_params)
    end
  end
end
