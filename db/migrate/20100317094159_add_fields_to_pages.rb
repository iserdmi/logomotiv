class AddFieldsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :visible, :boolean
    add_column :pages, :meta_keywords, :string
    add_column :pages, :meta_description, :string
  end

  def self.down
    remove_column :pages, :meta_description
    remove_column :pages, :meta_keywords
    remove_column :pages, :visible
  end
end
