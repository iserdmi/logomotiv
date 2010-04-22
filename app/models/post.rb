class Post < ActiveRecord::Base
  acts_as_taggable
  cattr_reader :per_page
  @@per_page = 3
  belongs_to :page
  default_scope :order => :created_at
  validates_presence_of :title, :content
end
