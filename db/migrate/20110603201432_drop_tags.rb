class DropTags < ActiveRecord::Migration
  def self.up
    drop_table :tags
  end

  def self.down
    create_table :tags
  end
end
