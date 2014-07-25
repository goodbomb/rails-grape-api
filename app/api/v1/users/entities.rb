module V1
	module Users
		class Entities < Grape::Entity
			expose :id, :documentation => {:type => "integer", :desc => "The numeric id of the user"}
			expose :email, :documentation => {:type => "string", :desc => "The email address of the user"}
			expose :first_name, :documentation => {:type => "string", :desc => "The user's First Name"}
			expose :last_name, :documentation => {:type => "string", :desc => "The user's Last Name"}
			expose :created_at, :documentation => {:type => "datetime", :desc => "The date and time when the user was created"}
			expose :updated_at, :documentation => {:type => "datetime", :desc => "The date and time when the user was last updated"}
			expose :last_sign_in_at, :documentation => {:type => "datetime", :desc => "The date and time when the user last signed in"}
		end
	end
end

# Ex.Entities: https://github.com/bloudraak/grape-sample-blog-api-with-entities/blob/master/app/api/blog/entities.rb