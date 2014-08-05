module V1
	class Base < API::Root
		mount V1::Users::Users
	end
end