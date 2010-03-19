class Admin::GalleryController < AdminController
  before_filter :find_gallery, :only => [:show, :edit, :update, :destroy]

  # GET /gallerys
  # GET /gallerys.xml
  def index
    @gallerys = Gallery.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @gallerys }
    end
  end

  # GET /gallerys/1
  # GET /gallerys/1.xml
  def show
    @gallery = Gallery.first
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @gallery }
    end
  end

  # GET /gallerys/new
  # GET /gallerys/new.xml
  def new
    @gallery = Gallery.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @gallery }
    end
  end

  # GET /gallerys/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /gallerys
  # POST /gallerys.xml
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |wants|
      if @gallery.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_gallerys_url) }
        wants.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gallerys/1
  # PUT /gallerys/1.xml
  def update
    respond_to do |wants|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_gallerys_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gallerys/1
  # DELETE /gallerys/1.xml
  def destroy
    @gallery.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_gallerys_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_gallery
      @gallery = Gallery.find(params[:id])
    end

end
