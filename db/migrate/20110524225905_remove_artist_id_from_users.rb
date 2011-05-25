class RemoveArtistIdFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :artist_id
  end

  def self.down
    add_column :users, :artist_id, :integer
  end
end
