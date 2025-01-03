class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # # [devise]
  # # permit username parameter
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # # [Authority]
  # before_action :authenticate_user!

  # ### helper
  helper_method :current_user
  helper_method :user_signed_in?

  before_action :authenticate_request

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



  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :username, :name, :department])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :username, :name, :department])
  # end

  # # role & auth
  # def authority_forbidden(error)
  #   Authority.logger.warn(error.message)
  #   redirect_to request.referrer.presence || root_path, :danger => t('not_auth')
  # end

  # def search
  #   @results = Exersize.where('name LIKE ?', "%#{params[:exersize]}%")
  #   p @results
  #   render partial: 'components/search_results', locals: { results: @results }
  # end
end
