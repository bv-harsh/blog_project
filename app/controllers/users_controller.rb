class UsersController < ApplicationController
  def index
  end

	def signIn
	end

	def validate
    @user = User.find_by(username: params[:username])
		
		if @user.present? && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			url = "/signIn/#{@user.id}"
      redirect_to url
    else
      flash[:alert] = "Invalid email or password"
			render :signIn
    end
	end
	
	def home
		if session[:user_id]
			@user = User.find(params[:user_id])
		else
			render :signIn
		end
	end
	
	def new
		@user = User.new
	end

	def create
		flag = User.new_user(params)
	
		if flag != 0
			redirect_to action: "index"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def logOut
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end
