class RemoveUserIdFromArtists < ActiveRecord::Migration
  def self.up
    remove_column :artists, :user_id
  end

  def self.down
    add_column :artists, :user_id, :integer
  end
end
