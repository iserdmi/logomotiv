class PagesController < ApplicationController

  def index
    @page = Page.find(:first, :conditions =>  {:visible => false })
    render :template => "pages/show", :layout => 'home'
  end
  
  def show
    @page = Page.find_by_id(params[:id])
    if @page.root? && @page.children.size > 0
      @page = @page.children.first
    end
  end
end
