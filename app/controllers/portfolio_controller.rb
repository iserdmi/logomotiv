class PortfolioController < ApplicationController
  before_filter :find_page
  
  def index
#    @clients = Client.all
    
   # redirect_to '/portfolio/sites/images' unless params[:section]
  end

  def companies
    render :template => "portfolio/companies"
  end
  
  def images
    @projects = Project.find(:all, :conditions => {:section => params[:section]})
    render :template => "portfolio/images"
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def section
    redirect_to :action => "images"
  end

  protected
  
  def find_page
    @page = Page.find_by_permalink("portfolio")
  end
end
