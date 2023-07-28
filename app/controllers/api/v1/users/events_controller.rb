class Api::V1::Users::EventsController < ApplicationController
  def hosting
   hosting = Event.where(user_id: params[:id])

   render json: EventShowSerializer.new(hosting)
  end
end