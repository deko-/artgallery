class AddNameAndArtworkCountToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :name, :string
    add_column :artists, :artwork_count, :integer, :default => 0
  end

  def self.down
    remove_column :artists, :artwork_count
    remove_column :artists, :name
  end
end
