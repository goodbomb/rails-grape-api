require 'faker'

20.times do
	User.create(
		:first_name => Faker::Name.first_name,
		:last_name => Faker::Name.last_name,
		:email => Faker::Internet.email,
		:password => "password"
	)
end

puts "#{'*'*(`tput cols`.to_i)}\n20 users created!\n#{'*'*(`tput cols`.to_i)}"