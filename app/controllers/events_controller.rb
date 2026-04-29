class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(allowed_event_params)
    @event.host_id = Current.user.id

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
    @event = Event.find(params[:id])
  end

  def allowed_event_params
    params.expect(event: %i[title description time date location host_id])
  end
end
