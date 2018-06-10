extends 'events/admins/events/event'

object present(event)

child :location do
  attribute :latitude, :longitude, :information
end

child(event.info_blocks) { attributes *Events::InfoBlock::ATTRIBUTES }
