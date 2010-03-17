class RedirectController < ApplicationController
  def index
    @page = Page.find_by_path("/"+params[:path].join("/"))
    if @page
      #@page = @page.children.first unless @page.content
      render(@page)
    else
      redirect_to "/404.html"
    end
  end
end
