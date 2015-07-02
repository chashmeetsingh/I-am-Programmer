class ProfileController < ApplicationController
	def profile
		user = User.find(session[:user_id])
		@user1 = User.find_by(:username=>params[:username])
		if user.username != @user1.username
			@user1.views += 1
			@user1.save
		end
	end
end
