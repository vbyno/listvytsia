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

    def self.to_period(from, till)
      if from.month == till.month && from.year == till.year
        "%d - %d.%02d.%d" % [from.day, till.day, till.month, till.year]
      elsif from.year == till.year
        "%d.%02d - %d.%02d.%d" % [from.day, from.month, till.day, till.month, till.year]
      else
        "%d.%02d.%d - %d.%02d.%d" % [ from.day, from.month, from.year, till.day, till.month, till.year]
      end
    end

    def self.treat_as_utc(date)
      (date.to_time + date.to_time.utc_offset).utc
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
