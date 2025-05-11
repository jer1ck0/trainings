class ApplicationController < ActionController::API
    private

  def authenticate_request
    p 'headers'
    p request.headers
    auth_header = request.authorization
    token = auth_header.split(' ').last if auth_header.present?
    p token
    begin
      decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')[0]
      @current_user = User.find_by_username(decoded_token["username"])
    rescue JWT::DecodeError
      render json: { errors: ['Not authenticated'] }, status: :unauthorized
    end
  end
end
