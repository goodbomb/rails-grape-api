class User::ConfirmationsController < Devise::ConfirmationsController

	def show
		self.resource = resource_class.confirm_by_token(params[:confirmation_token])

		if resource.errors.empty?
			set_flash_message(:notice, :confirmed) if is_navigational_format?
			sign_in(resource_name, resource)
			respond_with_navigational(resource){ redirect_to
			    after_confirmation_path_for(resource_name, resource) }
		else
			flash[:notice] = "Your account is already confirmed. Please login."
			redirect_to ENV["ACCOUNT_CONFIRMATION_PATH"]
		end
	end

	protected
	# Redirect to ACCOUNT_CONFIRMATION_PATH on confirmation
	def after_confirmation_path_for(resource_name, resource)
		ENV["ACCOUNT_CONFIRMATION_PATH"]
	end

end