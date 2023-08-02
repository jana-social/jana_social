class Api::V1::Users::SearchEventsController < ApplicationController
  def index
    user = User.find(params[:id])
    distance = params[:distance]

    if distance.present? && distance.to_i.positive?
      events = user.events_nearby(distance)
      render json: EventIndexSerializer.new(events)
    else
      render json: { error: "No results found" }, status: 400
    end
  end
end