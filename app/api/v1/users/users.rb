module V1
	module Users
		class Users < Grape::API
			include V1::Defaults

			resource :users do

			    desc "Return list of users"
			    get do
					@users = User.all
					present @users, with: V1::Users::Entities
			    end

			    desc "Return a single user"
			    get ':id' do
					@user = User.find(params[:id])
					present @user, with: V1::Users::Entities
				end

				desc "Create a New User"
				post do
					@user = User.new
					@user.title = params[:title] if params[:title]
					@user.description = params[:description] if params[:description]
					@user.save 

					status 201
				#	present @user, with: User::Entities::Users
				end

				desc "Update a single user"
				put ':id' do
					@user = User.find(params[:id])
					@user.title = params[:title] if params[:title]
					@user.description = params[:description] if params[:description]
					@user.save

				#	present @user, with: User::Entities::Users
				end

				desc "Delete a single user"
				delete ':id' do
					User.destroy(params[:id])
				end
			end

		end # End Class
	end
end

# Example: https://github.com/bloudraak/grape-sample-blog-api-with-entities/blob/master/app/api/blog/api.rb