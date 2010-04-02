class AddTemplateToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :template, :string
  end

  def self.down
    remove_column :projects, :template
  end
end
