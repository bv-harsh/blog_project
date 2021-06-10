class UsersController < ApplicationController
	before_action :authorize, except: [:index, :all, :sign_in, :validate, :new, :create]
	def index
	end

	def sign_in
	end

	def validate
		@user = User.where(username: params[:username]).first

		if @user.present? && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			set_current_user
			redirect_to "/sign_in/#{@user.id}"
		else
			flash[:alert] = "Invalid email or password"
			render :sign_in
		end
	end

	def home
	end

	def new
		@user = User.new
	end

	def create
		user = User.new_user(params)

		if user
			redirect_to action: "index" 
		else
			render :new
		end
	end

	def show
	end

	def log_out
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged out"
	end
end
