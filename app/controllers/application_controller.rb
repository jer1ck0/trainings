class ApplicationController < ActionController::API
    private

  def authenticate_request
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header.present?

    begin
      decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')[0]
      @current_user = User.find(decoded_token["user_id"])
    rescue JWT::DecodeError
      render json: { errors: ['Not authenticated'] }, status: :unauthorized
    end
  end
end
