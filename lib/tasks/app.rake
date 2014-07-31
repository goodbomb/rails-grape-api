namespace :app  do
	# Checks and ensures task is not run in production.
	task :ensure_development_environment => :environment do
		if Rails.env.production?
			raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
		end
	end

	# Custom install for developement environment
	desc "Install"
	task :install => [:ensure_development_environment, "db:setup", "db:migrate", "db:seed"]

	# Rebuild database and schema for developement environment
	desc "Rebuild"
	task :rebuild => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed"]
end