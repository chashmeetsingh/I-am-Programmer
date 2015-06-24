class AuthController < ApplicationController
  
  before_action :confirmed_login , :except=>[:login,:signup,:attempt_login,:attempt_signup]

  def login
  	if !session[:username].nil?
  		render :dashboard
  	end
  end

  def signup
  	if !session[:username].nil?
  		render :dashboard
  	end
  end

  def attempt_signup
  	user = User.create(user_params)
  	user.save

  	if user.save
  		redirect_to(:action=>'login')
  	else
  		flash[:notice] = "Invalid Details"
  		redirect_to(:action=>'signup')
  	end	
  end	

  def attempt_login
	if params[:username].present? && params[:password].present?
		@found_user = User.where(:username=>params[:username],:password=>params[:password]).first
	end
	if @found_user
		session[:user_id] = @found_user.id
		session[:user_name] = @found_user.username
    flash[:notice] = "Successfully Logged In !"
		redirect_to(:action=>'panel')
	else
		flash[:notice]="Invalid login credentials!"
		redirect_to(:action=>'login')
	end
  end 

  def panel
  	render :dashboard
  end

  def logout
  	session[:user_name]=nil
  	session[:user_id]=nil
  	flash[:notice]="You have successfully logged out"
  	redirect_to(:action=>'login')
  end	
  
  def user_params
  	params.require(:user).permit(:username,:password,:email)
  end

end
