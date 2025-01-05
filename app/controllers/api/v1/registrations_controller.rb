class Api::V1::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
        p resource
        p sign_up_params
      build_resource(sign_up_params)
  
      if resource.save
        sign_in resource
        render json: { message: 'User created successfully.', user: resource }
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username)
    end
  end
  