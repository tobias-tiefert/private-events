class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new
    @event_id = params[:invitation][:event_id].to_i
    @invitation.event_id = @event_id
    @invitation.attendee_id = params[:invitation][:attendee_id]
    @invitation.response = params[:invitation][:response]

  @invitation.save
      redirect_to event_path(@event_id)
  end

  def update
    @invitation = Invitation.find(params[:id])
    @event_id = params[:invitation][:event_id].to_i
    @invitation.event_id = @event_id
    @invitation.attendee_id = params[:invitation][:attendee_id]
    @invitation.response = params[:invitation][:response]

  @invitation.save
      redirect_to event_path(@event_id)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @event_id = @invitation.event.id
    @invitation.destroy
    redirect_to event_path(@event_id)
  end
end
