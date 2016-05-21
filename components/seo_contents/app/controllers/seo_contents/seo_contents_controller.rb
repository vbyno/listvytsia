require_relative 'application_controller'

module SeoContents
  class SeoContentsController < ApplicationController
    respond_to :json

    helper_method :seo_content

    def show; end
    def create; end

    def update
      seo_content.update_attributes(seo_content_params)
    end

    def destroy
      seo_content.destroy
    end

    private

    def seo_content_params
      params.require(:seo_content).permit(:page_id, :alt, :title, :data)
    end

    def seo_content
      @seo_content ||= params[:id] ? SeoContent.find(params[:id]) : SeoContent.create(picture_params)
    end
  end
end
