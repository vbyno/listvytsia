require_dependency 'pictures/application_controller'

module Pictures
  class PicturesController < ApplicationController
    respond_to :json

    def index
      @pictures = Picture.by_page_id(params[:page_id])
    end

    def create
      @picture = Picture.create(picture_params)
    end

    private

    def picture_params
      params[:picture].reverse_merge!(page_id: params[:page_id])

      params.require(:picture).permit(:page_id, :alt, :title, :data)
    end
  end
end
