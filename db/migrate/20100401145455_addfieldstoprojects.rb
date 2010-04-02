class Addfieldstoprojects < ActiveRecord::Migration
  def self.up
    add_column(:projects, :header, :text)
    add_column(:projects, :image_caption, :string)
    add_column(:projects, :image_html, :text)
    add_column(:projects, :task, :text)
    add_column(:projects, :solution, :text)
    add_column(:projects, :about, :text)
  end

  def self.down
    remove_column :projects, :header
    remove_column :projects, :image_caption
    remove_column :projects, :image_html
    remove_column :projects, :task
    remove_column :projects, :about
    remove_column :projects, :solution
  end
end
