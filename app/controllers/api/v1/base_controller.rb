class Api::V1::BaseController < ActionController::Base
  HMAC_SECRET = Rails.application.credentials.dig(:jwt, :hmac_secret)
  skip_before_action :verify_authenticity_token
  before_action :verify_request, except: [:login]
  rescue_from StandardError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end

  def verify_request
    token = get_jwt_token
    if token.present?
      data = jwt_decode(token)
      user_id = data[:user_id]
      @current_user = User.find(user_id)
    else
      render json: { error: 'Missing JWT token.' }, status: 401
    end
  end

  def jwt_decode(token)
    decoded_info = JWT.decode(token, HMAC_SECRET, { algorithm: 'HS256' })[0]
    HashWithIndifferentAccess.new decoded_info
  end

  def get_jwt_token
    request.headers['X-USER-TOKEN']
  end
end
