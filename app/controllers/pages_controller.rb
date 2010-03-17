class PagesController < ApplicationController

  def index
    @page = Page.first
    render :template => "pages/show"
  end
  
  def show
    @page = Page.find_by_id(params[:id])
  end
end
