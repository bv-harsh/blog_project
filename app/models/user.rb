class User < ApplicationRecord
	has_secure_password
	has_many :articles, dependent: :destroy

	def self.new_user(params)
		user = User.create(username: params[:user][:username], 
											 password: params[:user][:password])
		user
	end
end
