class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable, 
	       :recoverable, :rememberable, :trackable, :validatable

	class Roles < User
		ROLES = [ "admin", "user" ]
	end

	# Soft Delete user when "destroy" method is called instead of a deleting entire database field
	def soft_delete
		update_attribute(:deleted_at, Time.current)
	end

	# Ensure deleted users cannot sign in
	def active_for_authentication?
		super && !deleted_at
	end

	# Used for user authentication
	def ensure_authentication_token
		self.authentication_token = generate_authentication_token
		self.save!
		self.authentication_token
	end

	private

	def generate_authentication_token
		loop do
			token = Devise.friendly_token
			break token unless User.where(authentication_token: token).first
		end
	end
	
end
