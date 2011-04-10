class CommentsController < ApplicationController
	load_and_authorize_resource :nested => :artwork
	# GET /comments
  # GET /comments.xml
	def index
		@artwork = Artwork.find(params[:artwork_id])
    @comments = @artwork.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
  	@artwork = Artwork.find(params[:artwork_id])
    @comment = @artwork.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
  	@artwork = Artwork.find(params[:artwork_id])
    @comment= @artwork.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
  	@artwork = Artwork.find(params[:artwork_id])
    @comment = @artwork.comments.create(params[:comment].merge(:user_id => current_user))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@artwork, :notice => 'Artwork was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Artwork was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
