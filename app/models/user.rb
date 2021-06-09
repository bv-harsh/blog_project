require 'bcrypt'

class User < ApplicationRecord	
	include BCrypt
	has_secure_password
	has_many :articles, dependent: :destroy

	def self.new_user(params)
		user = User.create(username: params[:user][:username], 
											 password: params[:user][:password])
		if user.save
			user.id
		else
			0
		end
	end

	def self.extract_articles(id)
		user = User.find(id)
	end
end
