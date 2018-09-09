class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  		user_params.permit(:name, :introduce, :email, :password, :password_confirmation, :current_password, :deleted_at, :accepted)
    end
	end

	def after_sign_in_path_for(resource)
		case resource
		when User
    	root_path
  	when Administrator
   		root_path
  	end
	end

	def after_sign_out_path_for(resource)
    if resource == :user
      root_path
    else
      new_administrator_session_path
    end
  end
end
