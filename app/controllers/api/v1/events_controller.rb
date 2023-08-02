class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all.where(private_status: false)

    render json: EventIndexSerializer.new(events)
  end

  def show
    event = Event.find(params[:id])

    render json: EventShowSerializer.new(event)
  end

  def create
    event = Event.new(event_params)
    return unless event.save

    render json: EventShowSerializer.new(event), status: :created
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    render json: EventShowSerializer.new(event), status: :accepted
  end

  def delete
    event = Event.find(params[:id])

    event.destroy
  end

  private

  def event_params
    params.permit(
      :title,
      :description,
      :street_address,
      :zipcode,
      :date_time,
      :private_status,
      :user_id
    )
  end
end
