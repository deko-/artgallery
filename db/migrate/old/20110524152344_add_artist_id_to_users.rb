class AddArtistIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :artist_id, :integer
  end

  def self.down
    remove_column :users, :artist_id
  end
end