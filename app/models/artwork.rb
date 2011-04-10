class Artwork < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	belongs_to :artist
	mount_uploader :image, ImageUploader
	attr_accessible :image, :name, :description, :width, :height
end
