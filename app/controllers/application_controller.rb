class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # skip_before_filter :verify_authenticity_token

  def current_athlete
    token = request.headers['Access-Token']
    token && Athlete.find_by(access_token: token)
  end

  def authenticate_with_token!
    unless current_athlete
      render json: { message: "Access token not found." },
        status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: "Could not find the requested object: #{params}" },
      status: :not_found
  end

end