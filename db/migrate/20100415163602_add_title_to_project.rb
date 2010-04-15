class AddTitleToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :nav_title, :string
  end

  def self.down
    remove_column :projects, :nav_title
  end
end
