class User::UserController < ApplicationController
	before_filter :authenticate_user_from_token!

	def index
		if current_user
			render nothing: true
		else
			render json: {}, status: :unauthorized
		end
end
