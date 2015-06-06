class Post < ActiveRecord::Base
  validates_presence_of :title, :image
  belongs_to :user,
    foreign_key: "user_id"
    
  mount_uploader :image, PhotoUploader
end
