module Events
  class EventsController < Core::ApplicationController
    helper_method :event

    def show; end

    private

    def event
      @event ||= policy_scope(Event).find_by(city: city.name, permalink: params[:permalink])
    end

    def city
      @city ||= MicroGroups::Region.find_by(permalink: params[:region_permalink])
    end
  end
end
