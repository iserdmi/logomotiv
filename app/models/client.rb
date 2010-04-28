class Client < ActiveRecord::Base
  has_many :projects
  belongs_to :page #, :through => :projects
  has_attached_file :image
  has_attached_file :grey_image
end
