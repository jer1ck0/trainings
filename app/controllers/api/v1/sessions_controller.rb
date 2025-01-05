class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = login(params[:email], params[:password])

    if user
      render json: { message: 'Login successful', token: user.authentication_token }, status: :ok
    else
      render json: { errors:v1 ['Invalid email or password'] }, status: :unauthorized
    end
  end

  def destroy
    logout
    head :no_content
  end
end