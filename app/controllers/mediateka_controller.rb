class MediatekaController < ApplicationController
   
  def index
    @page = Page.find_by_permalink('mediateka')
    @medias = Media.find(:all)
  end
  
  def show
     @media = Media.find_by_url(params[:slug])
     @page = Page.find_by_permalink('mediateka')
  end
end
