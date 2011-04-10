class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
    	t.integer :comment_id
      t.references :artwork
      t.references :user
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
