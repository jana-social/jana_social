class ApplicationController < ActionController::Base
  helper_method :current_user
  
  rescue_from ActiveRecord::RecordNotFound, with: :error_response

  def error_response(error)
    render json: ErrorSerializer.new(error).serialize_json, status: :not_found
  end

  def welcome
  end

  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to root_path
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
