
class Account::SetupModule::OrganizationSetup::ClientUsersController < Account::SetupModule::OrganizationSetupController
  set_tab :client_users
  
  def index
    @client_users = ClientUser.order("created_at")
    @client_users_grid = initialize_grid(ClientUser, :include => [:branch, :concept, :client])
  end
  
  def show
    @client_user = ClientUser.find(params[:id])
  end
  
  def new
    @client_user = ClientUser.new
  end
  
  def edit
    @client_user = ClientUser.find(params[:id])
  end
  
  def create
    @client_user = ClientUser.new(params[:client_user])
    
    if @client_user.save
      flash[:success] = "User has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @client_user = ClientUser.find(params[:id])

    if @client_user.update_attributes(params[:client_user])
      flash[:success] = "User was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @client_user = ClientUser.find(params[:id])
    @client_user.destroy
    
    flash[:success] = "User was successfully deleted"
    redirect_to :action => :index
  end
end
