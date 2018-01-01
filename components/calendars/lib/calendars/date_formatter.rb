module Calendars
  class DateFormatter
    MONTHS = %w(
      січня
      лютого
      березня
      квітня
      травня
      червня
      липня
      серпня
      вересня
      жовтня
      листопада
      грудня
    ).freeze

    def self.to_day_and_month(*args)
      new(*args).call
    end

    def self.to_period(start_date, end_date)
      if start_date.month == end_date.month && start_date.year == end_date.year
        "#{ start_date.day } - #{ end_date.day } #{ MONTHS[start_date.month - 1] }"
      else
        "#{ to_day_and_month(start_date) } - #{ to_day_and_month(end_date) }"
      end
    end

    attr_reader :date

    def initialize(date)
      @date = date.to_time
    end

    def call
      "#{ date.day } #{ MONTHS[date.month - 1] }"
    end
  end
end
