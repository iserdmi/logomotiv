class Image < ActiveRecord::Base
  has_attached_file :image
  sortable
  default_scope :order => "position"
end
