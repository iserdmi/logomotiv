class Block < ActiveRecord::Base
  #has_many :assets
  belongs_to :page
  acts_as_polymorphic_paperclip
  
  named_scope :left, :conditions => {:orientation => 'left'}
  named_scope :right, :conditions => {:orientation => 'right'}
end
