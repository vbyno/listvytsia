extends 'events/admins/events/event'

if event.valid?
  object present(event)
else
  { errors: event.errors.full_messages }
end
