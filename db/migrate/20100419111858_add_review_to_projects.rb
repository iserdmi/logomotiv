class AddReviewToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :review_file_name, :string
  end

  def self.down
    remove_column :projects, :review_file_name
  end
end
