class AuthController < ApplicationController
  
  before_action :confirmed_login , :except=>[:login,:signup,:attempt_login,:attempt_signup]

  def login
  end

  def signup
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
      flash[:notice] = "Successfully Logged In !"
  		redirect_to(:controller=>'posts',:action=>'index')
  	else
  		flash[:notice]="Invalid login credentials!"
  		redirect_to(:action=>'login')
  	end
  end 


  def logout
    session[:user_id]=nil
  	flash[:notice]="You have successfully logged out"
  	redirect_to(:action=>'login')
  end	
  
  def attempt_change
    @user = User.find(session[:user_id])
    @user.password = params[:password]
    @user.save
    flash[:notice] = "Password changed successfully"
    redirect_to '/settings'
  end 

  def user_params
  	params.require(:user).permit(:username,:password,:email)
  end

end
