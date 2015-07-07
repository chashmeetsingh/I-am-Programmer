class ProfileController < ApplicationController
	def profile
		user = User.find(session[:user_id])
		@user1 = User.find_by(:username=>params[:username])
		if user.username != @user1.username
			@user1.views += 1
			@user1.save
		end
		@user1 = User.find_by(:username=>params[:username])
		posts = Post.where(:user_id=>User.find_by(:username=>params[:username]).id)
        @likes=0
        posts.each do |po|
          like = Like.where(:post_id=>po.id)
          if like  
            @likes += like.count
          end
        end
	end
end
