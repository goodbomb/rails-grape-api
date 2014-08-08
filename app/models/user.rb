class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable, 
	       :recoverable, :rememberable, :trackable, :validatable

	class Roles < User
		ROLES = [ "admin", "user" ]
	end

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
