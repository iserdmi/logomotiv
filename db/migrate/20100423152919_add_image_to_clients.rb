class AddImageToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :image_file_name, :string
  end

  def self.down
    remove_column :clients, :image_file_name
  end
end
