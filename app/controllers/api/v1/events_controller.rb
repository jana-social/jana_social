class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all.where(private_status: false)

    render json: EventIndexSerializer.new(events)
  end
end