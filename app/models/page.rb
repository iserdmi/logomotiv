class Page < ActiveRecord::Base
  acts_as_nested_set

  has_many :posts
  has_many :projects
  #has_many :banners
  has_many :blocks

  after_move :caching_level


  #validates_presence_of :title, :content, :message => "^Поля, помеченные звездочкой (*) должны быть заполнены!"
#  validates_numericality_of :parent_id, :on =
  validates_presence_of :title, :permalink
  sortable :scope => :parent_id
  
  #after_save :set_path #, :reload_routes
  before_save :set_path, :typograph
  
  default_scope :conditions => {:visible => true}, :order => "position"
 # named_scope :main, :conditions => {:permalink => "main", :published => false}
  
  
  def typograph
    self.content = Typograph.run! self.content
  end
  
  def path_name
    "#{'-' * self.level} #{self.name}"
  end
  
  def reload_pathes
    Page.all.each do |p|
      p.set_path && p.save!
    end
  end
  
  def full_permalink
    link = []
    self.self_and_ancestors.each do |p|
      link <<  p.permalink
    end
    return "/"+link.join("/")
  end
  
  def set_path
    self.path = full_permalink
  end
  
  
  
  def caching_level
    self.cached_level = level
    save!
  end
end
