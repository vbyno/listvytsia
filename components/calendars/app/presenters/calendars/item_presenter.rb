module Calendars
  class ItemPresenter < Core::BasePresenter
    presents :item

    def start_date
      str_time(super)
    end

    def end_date
      str_time(super)
    end

    def dates
      "#{ DateFormatter.(item.start_date) } - #{ DateFormatter.(item.end_date) }"
    end

    private

    def str_time(time)
      time.to_time.strftime('%Y-%m-%d')
      # time.to_time.strftime('%Y-%d-%m')
    end
  end
end
