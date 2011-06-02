class AboutsController < ApplicationController
  load_and_authorize_resource
  # GET /abouts
  # GET /abouts.xml
  def index
    @abouts = About.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @abouts }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.xml
  def show
    @about = About.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @about }
    end
  end

  # GET /abouts/new
  # GET /abouts/new.xml
  def new
    @about = About.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @about }
    end
  end

  # GET /abouts/1/edit
  def edit
    @about = About.find(params[:id])
  end

  # POST /abouts
  # POST /abouts.xml
  def create
    @old = About.all
    @old.destroy
    @about = About.new(params[:about])

    respond_to do |format|
      if @about.save
        format.html { redirect_to(@about, :notice => 'About was successfully created.') }
        format.xml  { render :xml => @about, :status => :created, :location => @about }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /abouts/1
  # PUT /abouts/1.xml
  def update
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to(@about, :notice => 'About was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.xml
  def destroy
    @about = About.find(params[:id])
    @about.destroy

    respond_to do |format|
      format.html { redirect_to(abouts_url) }
      format.xml  { head :ok }
    end
  end
end
