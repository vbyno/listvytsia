module Events
  module Admins
    class EventsController < Core::Admins::BaseController
      respond_to :json
      helper_method :events, :event

      def index; end
      def show; end

      def create
        event.save!
      end

      def update
        event.update_attributes!(event_params)
      end

      def destroy
        event.destroy
      end

      private

      def events
        @events ||= Events::Event.all
      end

      def event
        @event ||= params[:id] ? events.find(params[:id]) : events.new(event_params)
      end

      def event_params
        params.require(:event)
              .permit(*Event::ATTRIBUTES,
                      location: Location::ATTRIBUTES,
                      info_blocks: InfoBlock::ATTRIBUTES)
      end
    end
  end
end
