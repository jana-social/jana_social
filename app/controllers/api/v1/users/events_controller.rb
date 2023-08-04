class Api::V1::Users::EventsController < ApplicationController
  def hosting
    hosting = Event.where(user_id: params[:id])

    render json: EventShowSerializer.new(hosting)
  end

  def attending
    events = User.find(params[:id]).events

    render json: EventShowSerializer.new(events)
  end

  def show
    event = Event.find(params[:id])

    render json: EventShowSerializer.new(event)
  end
end
