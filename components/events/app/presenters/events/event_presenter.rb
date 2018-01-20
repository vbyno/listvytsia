module Events
  class EventPresenter < Core::BasePresenter
    presents :event

    def start_time
      str_time(super)
    end

    def end_time
      str_time(super)
    end

    def dates
      DateFormatter.to_period(event.start_time, event.end_time)
    end

    private

    def str_time(time)
      time.to_time.strftime('%Y-%m-%d')
      # time.to_time.strftime('%Y-%d-%m')
    end
  end
end
