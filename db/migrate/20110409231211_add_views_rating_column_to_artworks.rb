class AddViewsRatingColumnToArtworks < ActiveRecord::Migration
  def self.up
    add_column :artworks, :views, :integer
    add_column :artworks, :rating, :integer
  end

  def self.down
    remove_column :artworks, :rating
    remove_column :artworks, :views
  end
end
