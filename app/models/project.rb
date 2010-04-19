class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :page
  has_attached_file :image
  has_attached_file :review
  has_attached_file :case
  before_save :typograph
  default_scope :order => 'position ASC' #client_id ASC, 
  sortable :scope => :client_id
  belongs_to :branch
  cattr_reader :per_page
  @@per_page = 10
  
  named_scope :ident, :conditions => {:section => 'ident'}
  named_scope :graph_design, :conditions => {:section => 'graphical_design'}
  named_scope :sites, :conditions => {:section => 'sites'}
  named_scope :concepts, :conditions => {:section => 'concepts'}
    
  def typograph
  #  self.overs = Typograph.run! self.overs
   # self.body = Typograph.run! self.body
   # self.sidebar = Typograph.run! self.sidebar
  end
  
end
