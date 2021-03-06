class AuthController < ApplicationController
  
  before_action :confirmed_login , :except=>[:login,:signup,:attempt_login,:attempt_signup]
  

  def login
    if !session[:user_id].nil?
      redirect_to '/posts/index'
    end
  end

  def signup
    if !session[:user_id].nil?
      redirect_to '/posts/index'
    end
  end

  def attempt_signup
    par=user_params
  	user = User.create(par)
    user.views=0
    user.avatar = '/images/medium/profile.jpg'
  	user.save

  	if user.save
      flash[:notice] = "Signed Up successfully !"
      # Sends email to user when user is created.
      ApplicationMailer.verify_email(user).deliver_now
  		redirect_to(:action=>'login')
  	else
  		flash[:notice] = user.errors.full_messages
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
    user = User.find(session[:user_id])
    if user.update_attributes(:password => params[:password]) && params[:password]==params[:password_check]
      flash[:notice] = "Password Changed Successfully !!"
    else
      user.errors.each do |f,x|
        puts f,x
      end
      flash[:notice] = "Passwords do not match"
    end
    redirect_to '/settings'
  end 

  def update
    user = User.find(session[:user_id])
    if user.update_attributes(:full_name => params[:full_name],:email => params[:email],:country => params[:country],
      :about => params[:about],:website => params[:website])
      flash[:notice] = "Settings Updated !!"
    else
      puts user.errors.full_messages
      flash[:notice] = "Could Not Be Saved !!"
    end
    redirect_to '/settings'   
  end

  def profile_pic
    user = User.find(session[:user_id])
    if user.update(pic_params)
      flash[:notice] = "Profile Picture updated !!"
    else
      user.errors.each do |f,x|
        puts f,x
      end
      flash[:notice] = "Profile Picture could not be updated !!"
    end
    redirect_to '/settings'  
  end
  

  def user_params
  	params.require(:user).permit(:username,:password,:email)
  end

  def pic_params
    params.require(:user).permit(:avatar)
  end

end
