module V1
	class Base < Grape::API
		mount V1::Users::Users
		mount V1::Users::Entities
	end
end