class ArtistsController < ApplicationController
	load_and_authorize_resource
  # GET /artists
  # GET /artists.xml
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artists }
    end
  end

  # GET /artists/1
  # GET /artists/1.xml
  def show
    @artist = Artist.find(params[:id])
    @artworks = Artwork.where("artist_id = #{params[:id]}")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.xml
  def new
    @artist = Artist.new
    @user = User.where("is_artist IS NULL")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
    @user = User.where("is_artist IS NULL")
  end

  # POST /artists
  # POST /artists.xml
  def create
    @artist = Artist.new(params[:artist])
    unless params[:artist][:user_id].nil? || params[:artist][:user_id].empty?
      @user = User.find(params[:artist][:user_id])
      @user.is_artist = 1
      @user.save
    end
    
    respond_to do |format|
      if @artist.save
        format.html { redirect_to(@artist, :notice => 'Artist was successfully created.') }
        format.xml  { render :xml => @artist, :status => :created, :location => @artist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.xml
  def update
    @artist = Artist.find(params[:id])
    unless params[:artist][:user_id].nil? || params[:artist][:user_id].empty?
      @user = User.find(params[:artist][:user_id])
      @user.is_artist = 1
      @user.save
    else
      @user = User.find(@artist.user_id)
      @user.is_artist = nil
      @user.save
    end
    
    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to(@artist, :notice => 'Artist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.xml
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(artists_url) }
      format.xml  { head :ok }
    end
  end
end
