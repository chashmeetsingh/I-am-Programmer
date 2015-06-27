class User < ActiveRecord::Base
	has_many :posts
	validates_presence_of :username,:password,:email
end
