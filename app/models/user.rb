class User < ActiveRecord::Base
	
	VALID_USERNAME_REGEX = /^[a-zA-Z0-9]+$/
    validates :username, presence: true, length: { maximum: 20 },
                                    format: { with: VALID_USERNAME_REGEX },
                                    uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 },  presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: true,  length: { maximum: 50 },
	                  format: { with: VALID_EMAIL_REGEX },  presence: true
	
	mount_uploader :avatar , PhotoUploader

	has_many :posts, through: :likes ,:foreign_key => :post_id
	has_many :likes
end
