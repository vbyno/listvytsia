module Calendars
  class ItemPresenter < Core::BasePresenter
    presents :item

    def start_date
      str_time(super)
    end

    def end_date
      str_time(super)
    end

    def course
      return super if region.nil? || event.nil?

      h.link_to event.title, "/#{ region.permalink }/events/#{ event.permalink }"
    end

    def city
      return super unless region

      h.link_to(region.name, "/#{ region.permalink }")
    end

    def dates
      DateFormatter.to_period(item.start_date, item.end_date)
    end

    private

    def region
      return @region if defined?(@region)

      @region = MicroGroups::Region.by_name(item.city).first
    end

    def event
      return @event if defined?(@event)

      @event = Events::Event.by_title(item.course).by_city(item.city).first
    end

    def str_time(time)
      time.to_time.strftime('%Y-%m-%d')
      # time.to_time.strftime('%Y-%d-%m')
    end
  end
end
