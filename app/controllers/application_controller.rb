class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error_response

  def error_response(error)
    render json: ErrorSerializer.new(error).serialize_json, status: :not_found
  end

  def welcome
  end
end
