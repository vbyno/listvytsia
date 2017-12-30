module Calendars
  module Admins
    class ItemsController < Core::Admins::BaseController
      respond_to :json
      helper_method :items, :item

      def index; end
      def show; end

      def create
        item.save
      end

      def update
        item.update_attributes(item_params)
      end

      def destroy
        item.destroy
      end

      private

      def items
        @items ||= Calendars::Item.all
      end

      def item
        @item ||= params[:id] ? items.find(params[:id]) : items.new(item_params)
      end

      def item_params
        prepare(
          params.require(:item).permit(
            :contacts,
            :city,
            :start_date,
            :end_date,
            :course
          )
        )
      end

      def prepare(params_hash)
        params_hash['start_date'] = params_hash['start_date'].to_date.to_time
        params_hash['end_date'] = params_hash['end_date'].to_date.to_time

        params_hash
      end
    end
  end
end
