class DeleteArtistIdFromArtists < ActiveRecord::Migration
  def self.up
    remove_column :artists, :artist_id
  end

  def self.down
    add_column :artists, :artist_id, :integer
  end
end
