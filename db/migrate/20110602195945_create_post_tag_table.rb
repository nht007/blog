class CreatePostTagTable < ActiveRecord::Migration
  def self.up
    create_table :posts_tags, :id => false do |t|
      t.column :tag_id, :integer
      t.column :post_id, :integer
    end
    remove_column :tags, :post_id
    add_index :posts_tags, [:tag_id, :post_id]
    add_index :posts_tags, :post_id
  end

  def self.down
    add_column :tags, :post_id
    remove_index :posts_tags, [:tag_id, :post_id]
    remove_index :posts_tags, :post_id
    drop_table :posts_tags
  end
end
