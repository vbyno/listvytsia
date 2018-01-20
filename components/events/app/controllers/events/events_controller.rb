module Events
  class EventsController < Core::ApplicationController
    helper_method :event

    def show; end

    private

    def event
      @event ||= policy_scope(Event).order(start_time: :asc)
    end
  end
end
