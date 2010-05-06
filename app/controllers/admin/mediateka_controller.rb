class Admin::MediatekaController < AdminController
  layout "admin"
  before_filter :find_media, :only => [:show, :edit, :update, :destroy]
  
  def index
	@medias = Media.find(:all)
  end
  
  def new
    @media = Media.new(params[:media])
	if request.post?
		@media.save
		redirect_to :action => 'index'
	end
  end
  
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml { render :xml => @media }
    end
  end
  
  def custom_update
  @media = Media.find(params[:id])
	if request.post?
		@media.update_attributes(params[:media])
		redirect_to :action => 'index'
	end
  end
  
  def edit
        @media = Media.find(params[:id])
  end
  
  def destroy
   @media.destroy
   redirect_to :action => 'index'
  end
  
  private
    def find_media
      @media = Media.find(params[:id])
    end
  

  
end
