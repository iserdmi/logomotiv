class AddCaseToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :case_file_name, :string
  end

  def self.down
    remove_column :projects, :case_file_name
  end
end
