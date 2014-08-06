class User::RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters
	respond_to :json

	def create
		user = User.new(user_params)

		if user.save
			token = user.ensure_authentication_token
			render 	status: 201,
					json: { 
				auth_token: token,
				success: true,
				info: "Account Created",
				uid: user.id
			}
			return
		else
			render nothing: true, status: 422
		end
	end

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name)
	end
	 
	# Signs in a user on sign up. You can overwrite this method in your own
	# RegistrationsController.
	def sign_up(resource_name, resource)
		sign_in(resource_name, resource)
	end


 
	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
		  u.permit(:email, :password, :password_confirmation, :first_name, :last_name)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
		  u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
		end
	end
end
