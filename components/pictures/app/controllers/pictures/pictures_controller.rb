module Pictures
  class PicturesController < ApplicationController
    def index

    end

    def create
      @picture = Photo.create(picture_params)
    end

    private

    def picture_params
      params[:picture].reverse_merge!(page_id: params[:page_id])

      params.require(:picture).permit(:page_id, :alt, :title, :data)
    end
  end
end
