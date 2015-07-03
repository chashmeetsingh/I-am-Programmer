class ApiController < ApplicationController
	def check
		if Like.find_by(:user_id=>params[:user_id],:post_id=>params[:post_id])
			render json: 1
		else
			render json: 0	
		end
	end

	def like
		like=Like.create(:user_id=>params[:user_id],:post_id=>params[:post_id])
		if like.save
			render text: "Liked"
		else
			render text: "Could not like"
		end
	end

	def unlike
		if Like.find_by(:user_id=>params[:user_id],:post_id=>params[:post_id]).destroy
			render text: "Unliked"
		else
			render text: "Could not unlike"
		end	
	end
end
