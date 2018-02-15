module Calendars
  class CalendarsController < Core::ApplicationController
    helper_method :items

    def show; end

    private

    def items
      @items ||= policy_scope(Item).actual_at_time(Time.now).ordered_by_start_date
    end
  end
end
