class AddLeftBlockToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :sidebar_left, :text
  end

  def self.down
    remove_column :projects, :sidebar_left
  end
end
