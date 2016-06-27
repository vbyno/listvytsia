module AppComponent
  module Admins
    class StaticPagesController < Core::Admins::BaseController
      respond_to :json
      helper_method :static_pages, :static_page

      def index; end
      def show; end

      def create
        static_page.save
      end

      def update
        static_page.update_attributes(static_page_params)
      end

      private

      def static_pages
        @static_pages ||= AppComponent::StaticPage.all
      end

      def static_page
        @static_page ||= params[:id] ? static_pages.find(params[:id]) : static_pages.new(static_page_params)
      end

      def static_page_params
        params.require(:static_page).permit(:permalink, :title, :content, :published,
                                            seo_content_attributes: [:title, :description, :keywords])
      end
    end
  end
end