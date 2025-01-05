class Api::V1::SessionsController < ApplicationController
  def create
    user = login(permitted_params[:email], permitted_params[:password])

    if user
      token = JWT.encode({ username: user.username }, ENV['SECRET_KEY_BASE'], 'HS256')
      render json: { user: user.username, token: token }, status: :ok
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end

  private
  def form_authenticity_token; end

  def permitted_params
    params.required(:session).permit(:email, :password)
  end
end