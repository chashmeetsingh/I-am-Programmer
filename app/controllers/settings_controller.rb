class SettingsController < ApplicationController
  before_action :confirmed_login
  def settings
  	user = User.find(session[:user_id])
  	if user.avatar.nil?
  		user.update(:avatar => 'medium/profile.jpg')
  	end	
  end

end
