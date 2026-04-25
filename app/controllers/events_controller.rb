class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
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

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def allowed_event_params
    params.expect(event: %i[title description date time location])
  end
end
