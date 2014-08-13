20.times do
	admin = User.create do |u|
		u.role = User::Roles::ROLES[1]
	    u.first_name = Faker::Name.first_name
	    u.last_name = Faker::Name.last_name
	    u.email = Faker::Internet.email
	    u.password = "password"
	    u.confirmed_at = DateTime.now
		u.skip_confirmation!
	    u.skip_confirmation_notification!
	    u.save!
	end
end

puts "#{'*'*(`tput cols`.to_i)}\n20 users created!\n#{'*'*(`tput cols`.to_i)}"