class Artist < ActiveRecord::Base
  has_one :user
  has_many :artworks
end
