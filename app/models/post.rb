class Post < ActiveRecord::Base
  validates_presence_of :title, :image
  belongs_to :user
    
  mount_uploader :image, PhotoUploader
end
