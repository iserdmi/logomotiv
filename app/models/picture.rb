class Picture < Asset

  # === List of columns ===
  #   id                : integer 
  #   data_file_name    : string 
  #   data_content_type : string 
  #   data_file_size    : integer 
  #   assetable_id      : integer 
  #   assetable_type    : string 
  #   type              : string 
  #   locale            : integer 
  #   user_id           : integer 
  #   created_at        : datetime 
  #   updated_at        : datetime 
  # =======================

  
  has_attached_file :data,
                    :url  => "/assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/pictures/:id/:style_:basename.:extension",
	                  :styles => { :content => '910>', :thumb => '100x100' }
	
	validates_attachment_size :data, :less_than=>2.megabytes
	
	def url_content
	  url(:content)
	end
	
	def url_thumb
	  url(:thumb)
	end
	

	
	def to_json(options = {})
	  options[:methods] ||= []
	  options[:methods] << :url_content
	  options[:methods] << :url_thumb
	  super options
  end
  
  def filename
    data_file_name
  end
  
  def content_type
    data_content_type
  end
  
  def size
    data_file_size
  end
  
  def path
    data.path
  end
  
  def styles
    data.styles
  end
  
  def format_created_at
    I18n.l(self.created_at, :format=>"%d.%m.%Y %H:%M")
  end
  
  def to_xml(options = {})
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])

    xml.tag!(self.type.to_s.downcase) do
      xml.filename{ xml.cdata!(self.filename) }
      xml.size self.size
      xml.path{ xml.cdata!(self.url) }
      
      xml.styles do
        self.styles.each do |style|
          xml.tag!(style.first, self.url(style.first))
        end
      end unless self.styles.empty?
    end
  end
end
