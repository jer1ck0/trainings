class Api::V1::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_request

  def create
    user = User.find_by(email: permitted_params[:email])

    if user
      token = encode_token(user_id: user.id)
      render json: { user: user, jwt: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET_KEY_BASE'], 'HS256')
  end

  def permitted_params
    params.require(:auth).permit(:email, :username, :password)
  end
end

  