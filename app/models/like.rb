class Like < ActiveRecord::Base

	attr_accessible :post , :user

	belongs_to :book
	belongs_to :user
end
