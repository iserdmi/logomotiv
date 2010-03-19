class Admin::PhotosController < AdminController
  before_filter :find_photo, :only => [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.first
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |wants|
      if @photo.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_photos_url) }
        wants.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    respond_to do |wants|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_photos_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_photos_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_photo
      @photo = Photo.find(params[:id])
    end

end
