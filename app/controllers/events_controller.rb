class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :verify_user, only: %i[edit update destroy ]
  before_action :authorize_viewer, only: %i[show ]

  allow_unauthenticated_access only: %i[ index show ]

  def index
    @events = Event.visible
  end

  def show
    @user_id = User.current_user_id
    @attendees = @event.attendees
    @invitations = @event.invitations.includes(:attendee)
    @invitation = User.invitation_for(@event)
  end

  def new
    @event = Current.user.hosted_events.new
  end

  def edit
  end

  def create
    @event = Current.user.hosted_events.new(allowed_event_params)

    if @event.save
      redirect_to @event
    else
      flash.now[:alert] = "Event couldn't be saved."
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @event.update(allowed_event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def set_event
    @event = Event.includes(:invitations).find(params[:id])
  end



  def allowed_event_params
    params.expect(event: %i[title description time date location host_id visibility])
  end

  def verify_user
    redirect_to event_path unless authenticated? && @event.host == Current.user
  end

  def authorize_viewer
    # Erlaube Zugriff, wenn:
    # 1. Das Event öffentlich ist
    # 2. ODER der User der Host ist
    # 3. ODER der User eine Einladung hat
    return if @event.public_event?
    return if authenticated? && @event.host == Current.user
    return if @event.invitations.exists?(attendee: Current.user)

    # Wenn nichts davon zutrifft:
    redirect_to events_path, alert: "You don't have permission to see this event"
  end
end
