class AddGrayImageToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :grey_image_file_name, :string
  end

  def self.down
    remove_column :clients, :grey_image_file_name
  end
end
