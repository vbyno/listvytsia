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
    )

    def self.call(*args)
      new(*args).call
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
