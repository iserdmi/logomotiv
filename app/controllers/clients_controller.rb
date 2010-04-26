class ClientsController < ApplicationController

  def index
    @page = Page.find_by_permalink('clients')
    @clients = Client.find(:all, :conditions => "image_file_name IS NOT NULL") 
    render :template => 'layouts/clients'
  end
end
