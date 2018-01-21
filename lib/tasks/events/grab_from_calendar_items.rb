module Tasks
  module Events
    class GrabFromCalendarItems < Base
      BEGINNING_OF_EVENT = 9

      def call
        ::Events::Event.delete_all

        ::Calendars::Item.each do |calendar_item|
          city = calendar_item.city

          next unless MicroGroups::Region.by_name(city).exists?

          start_time = calendar_item.start_date.to_time.change(hour: BEGINNING_OF_EVENT)
          end_time = calendar_item.end_date.to_time.change(hour: BEGINNING_OF_EVENT)

          event = ::Events::Event.create!(
            title:      calendar_item.course,
            start_time: start_time,
            end_time:   end_time,
            contacts:   calendar_item.contacts,
            city:       city
          )

          calendar_item.update_attributes!(event_id: event.id.to_s,
                                           start_date: start_time,
                                           end_date: end_time)
        end
      end
    end
  end
end
