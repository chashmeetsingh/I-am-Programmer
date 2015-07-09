class ApplicationMailer < ActionMailer::Base
	default from: "admin@chashmeetsingh.com"
	def verify_email(user)
      @user = user
      mail(to: @user.email, subject: 'Site Verification')
    end  
end
