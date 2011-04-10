class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.integer :artist_id
      t.integer :user_id
      t.integer :spotter_id
      t.string :biography

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
