class API < Grape::API
	prefix ''
	mount V1::Base
	# mount V2::Base
	# etc.
end