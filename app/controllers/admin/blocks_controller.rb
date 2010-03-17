class Admin::BlocksController < ApplicationController
  layout "admin"
  before_filter :find_block, :only => [:show, :edit, :update, :destroy]

  # GET /blocks
  # GET /blocks.xml
  def index
    @blocks = Block.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @blocks }
    end
  end

  # GET /blocks/1
  # GET /blocks/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @block }
    end
  end

  # GET /blocks/new
  # GET /blocks/new.xml
  def new
    @block = Block.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @block }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
  end

  # POST /blocks
  # POST /blocks.xml
  def create
    @block = Block.new(params[:block])

    respond_to do |wants|
      if @block.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_blocks_url) }
        wants.xml  { render :xml => @block, :status => :created, :location => @block }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.xml
  def update
    respond_to do |wants|
      if @block.update_attributes(params[:block])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_blocks_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.xml
  def destroy
    @block.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_blocks_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_block
      @block = Block.find(params[:id])
    end

end
