class User::SessionsController < Devise::SessionsController
	before_filter :authenticate_user_from_token!, except: [:create]
	after_filter :set_csrf_headers, only: [:create, :destroy]

	def create
		user = User.find_for_database_authentication(email: params[:email])
		if user && user.valid_password?(params[:password])
			token = user.ensure_authentication_token
			render 	status: 200,
					json: { 
				auth_token: token,
				success: true,
				info: "Logged in",
				uid: user.id
			}
		else
			render nothing: true, status: :unauthorized
		end
	end

	def destroy
		current_user.authentication_token = nil
		current_user.save!
		render status: 200, json: {}
	end

	protected
	def set_csrf_headers
		cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?  
	end
end