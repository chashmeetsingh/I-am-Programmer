class Post < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title,:image,:hash_tag
end
