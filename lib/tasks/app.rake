namespace :app  do
  # Checks and ensures task is not run in production.
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  # Custom install for developement environment
  desc "Install"
  task :install => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:populate", "spec"]
 
  # Custom reset for developement environment
  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]

  # To run the populate_users command type "rake app:populate NUM_RECORDS=##" in the console,
  # where "##" is the number of entries that will be created.
  # ex: rake app:populate NUM_RECORDS=15
  desc "create some fake user data"
  task :populate => :environment do
    require 'faker'
    puts "#{'*'*(`tput cols`.to_i)}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*'*(`tput cols`.to_i)}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke
    # Adds seed data before dummy data
    Rake::Task['db:seed'].invoke

    num_records = ENV['NUM_RECORDS'].to_i
    num_records.times do
      User.create(
        :first_name => "Test", #Faker::Name.first_name,
        :last_name => "TestLast", #Faker::Name.last_name,
        :email => "test@test.com" #Faker::Internet.email
      )
    end
    print "#{'*'*(`tput cols`.to_i)}\n#{num_records} users created\n"
    puts "#{'*'*(`tput cols`.to_i)}\nThe database has been populated!\n#{'*'*(`tput cols`.to_i)}"
  end
end