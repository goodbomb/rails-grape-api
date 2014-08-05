source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use unicorn as the app server
gem 'unicorn'
# Devise user authentication
gem 'devise'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :default do
	# Required dependencies
	gem 'coffee-rails', '~> 4.0.0'
	gem 'jquery-rails'
	# Easy file attachment management for ActiveRecord.
	gem 'paperclip', '~> 4.1'
	# Dropbox file attachment storage
	gem 'paperclip-dropbox', '>= 1.1.7'
	# Simple Rails app configuration.
	gem 'figaro'
	# Generate Database SEED data for multiple environments
	gem 'seedbank'
	### API Gems ###
	gem 'grape'
	gem 'grape-entity'
	# Rack Middleware for handling Cross-Origin Resource Sharing (CORS)
	gem 'rack-cors', :require => 'rack/cors'
	# API Documentation Library
#	gem 'apipie-rails'
end

group :doc, :test do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	# Library for generating fake data such as names, addresses, and phone numbers. http://faker.rubyforge.org
	gem 'faker'
	# debugger2 is a fork of debugger for Ruby 2.0
	gem 'debugger2'
	# Better, more useful error handling
	gem "better_errors"
	# A library for setting up Ruby objects as test data.
#	gem 'factory_girl'
	# Rails Unit Testing RSPEC
#	gem 'rspec-rails'
end

group :production do
	# Makes running your Rails app easier. https://github.com/heroku/rails_12factor
	gem 'rails_12factor'
end