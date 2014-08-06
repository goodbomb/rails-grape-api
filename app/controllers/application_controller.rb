class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :null_session
	respond_to :json

	after_filter :set_csrf_cookie_for_ng

	# Authenticate user based on token
	def authenticate_user_from_token!
		token = request.headers["x-session-token"].presence
		user = token && User.find_by_authentication_token(token.to_s)
		if user
			sign_in user, store: false
		end
	end

	# CSRF protection when using AngularJS
	def set_csrf_cookie_for_ng
		cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
	end

	rescue_from ActionController::InvalidAuthenticityToken do |exception|
		sign_out(current_user)
		cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
		render :error => 'invalid token', :status => :unprocessable_entity
	end

	protected
	def verified_request?
		super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
	end
end
