class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.string :name
      t.string :description
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end

  def self.down
    drop_table :artworks
  end
end
