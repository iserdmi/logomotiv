class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :page
  has_attached_file :image
  before_save :typograph
  
  def typograph
    self.overs = Typograph.run! self.overs
    self.body = Typograph.run! self.body
    self.sidebar = Typograph.run! self.sidebar
  end
  
end
