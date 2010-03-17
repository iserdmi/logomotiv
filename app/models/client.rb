class Client < ActiveRecord::Base
  has_many :projects
  belongs_to :page #, :through => :projects
end
