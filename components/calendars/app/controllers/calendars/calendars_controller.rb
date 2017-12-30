module Calendars
  class CalendarsController < Core::ApplicationController
    helper_method :items

    def show; end

    private

    def items
      @items ||= policy_scope(Item).order(start_date: :asc)
    end
  end
end
