class AddArtistIdDefaultValueToUsers < ActiveRecord::Migration
  def self.up
    change_column_default :users, :artist_id, -1
  end

  def self.down
    change_column_default :users, :artist_id, NULL
  end
end