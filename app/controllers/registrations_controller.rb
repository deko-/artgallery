class RegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"
  def new
    super
  end
  
  def create
    @user = User.new(params[:user])
    @user.update_attribute :is_admin, true unless User.first()    # set admin if it's the first user

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    super
  end
end