module API
	class Root < Grape::API
		prefix '' # Appends to base URL ex: /api
		mount V1::Base
		# mount V2::Base
		# etc.
	end
end