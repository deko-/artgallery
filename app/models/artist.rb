class Artist < ActiveRecord::Base
  has_one :user
  has_many :artworks
  attr_accessible :name, :user_id, :biography
end
