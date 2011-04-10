class ChangeUseridToArtistidForArtworks < ActiveRecord::Migration
  def self.up
  	remove_column :artworks, :user_id
  	add_column :artworks, :artist_id, :integer
  end

  def self.down
  	add_column :artworks, :artist_id, :integer
  	remove_column :artworks, :user_id
  end
end
