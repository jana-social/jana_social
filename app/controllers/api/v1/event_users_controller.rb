class Api::V1::EventUsersController < ApplicationController
  def index
    attendees = Event.find(params[:event_id]).event_users

    render json: EventUserSerializer.new(attendees)
  end
end
