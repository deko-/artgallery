class AddUserIdToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :user_id, :integer, :default => -1
  end

  def self.down
    remove_column :artists, :user_id
  end
end