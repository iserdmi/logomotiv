class Admin::ImagesController < AdminController
  before_filter :find_Image, :only => [:show, :edit, :update, :destroy]

  # GET /Images
  # GET /Images.xml
  def index
    @images = Image.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @images }
    end
  end

  # GET /Images/1
  # GET /Images/1.xml
  def show
    @image = Image.first
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @image }
    end
  end

  # GET /Images/new
  # GET /Images/new.xml
  def new
    @image = Image.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @image }
    end
  end

  # GET /Images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /Images
  # POST /Images.xml
  def create
    @image = Image.new(params[:image])

    respond_to do |wants|
      if @image.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_images_url) }
        wants.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Images/1
  # PUT /Images/1.xml
  def update
    respond_to do |wants|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_images_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Images/1
  # DELETE /Images/1.xml
  def destroy
    @image.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_images_url) }
      wants.xml  { head :ok }
    end
  end

    def sort
  #render :text => params['.pages']
      if params['images']
        params['images'].each_with_index do |id, index|
          Image.update_all(['position=?', index+1], ['id=?', id])
        end
      end  
        render :nothing => true
    end
    
  private
    def find_Image
      @image = Image.find(params[:id])
    end

end
