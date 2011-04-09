class Artwork < ActiveRecord::Base
	belongs_to :artist
	mount_uploader :image, ImageUploader
	attr_accessible :image, :name, :description, :width, :height
end
