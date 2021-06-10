class ApplicationController < ActionController::Base
	helper_method :set_current_user

	def set_current_user
			@_current_user ||= User.where(id: session[:user_id]).first
			@_current_user
	end

	def authorize
		if !set_current_user
			redirect_to sign_in_path
		end
	end
end
