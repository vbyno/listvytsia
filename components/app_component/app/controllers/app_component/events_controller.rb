require_relative 'public_controller'

module AppComponent
  class EventsController < PublicController
    helper_method :events, :event

    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    def index; end
    def show; end
    def edit; end

    def new
      @event = Event.new

      authorize event
    end

    def create
      event.author ||= pundit_user

      if event.save
        redirect_to events_path, notice: t('.success')
      else
        flash.now[:error] = event.errors.full_messages.to_sentence
        render :new
      end
    end

    def update
      if event.update_attributes(event_params)
        redirect_to events_path, notice: t('.success')
      else
        flash.now[:error] = event.errors.full_messages.to_sentence
        render :edit
      end
    end

    private

    def events
      @events ||= policy_scope(Event)
    end

    def event
      return @event if defined?(@event)

      @event = params[:id] ? events.find_by(permalink: params[:id]) : Event.new(event_params)
      @event.present? ? authorize(@event) : skip_authorization
      @event
    end

    def event_params
      params.require(:event).permit(current_policy.permitted_attributes)
    end

    def current_policy
      return policy(@event) if defined?(@event)

      EventPolicy.new(pundit_user, nil)
    end
  end
end
