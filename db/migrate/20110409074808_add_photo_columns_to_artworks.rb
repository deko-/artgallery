class AddPhotoColumnsToArtworks < ActiveRecord::Migration
  def self.up
  	add_column :artworks, :image, :string
  end

  def self.down
  	remove_column :artworks, :image
  end
end
