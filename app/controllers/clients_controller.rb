class ClientsController < ApplicationController

  def index
    @page = Page.find_by_permalink('clients')
    @clients = Client.find(:all, :joins => :projects) 
    render :template => 'layouts/clients'
  end
end
