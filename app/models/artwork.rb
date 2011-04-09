class Artwork < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, ImageUploader
	attr_accessible :image, :name, :description, :width, :height
end
