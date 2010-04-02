class RedirectController < ApplicationController
  def index
    if Array === params[:path]
      @page = Page.find_by_path("/"+params[:path].join("/"))
    else
      @page = Page.find_by_path("/"+params[:path])
    end
    if @page
      #@page = @page.children.first unless @page.content
      render(@page)
    else
      redirect_to "/404.html"
    end
  end
end
