class User < ActiveRecord::Base
	
	validates_presence_of :username,:password,:email
	after_initialize :default_values
	
  	private
    def default_values
      self.avatar ||= "medium/profile.jpg"
    end
	mount_uploader :avatar , PhotoUploader

	has_many :posts, through: :likes ,:foreign_key => :post_id
	has_many :likes
end
