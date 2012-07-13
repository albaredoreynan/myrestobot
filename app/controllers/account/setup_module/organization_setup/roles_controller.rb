
class Account::SetupModule::OrganizationSetup::RolesController < Account::SetupModule::OrganizationSetupController
  set_tab :roles
  
  def index
    @roles = Role.order("updated_at")
    @roles_grid = initialize_grid(Role)
  end
  
  def show
    @role = Role.find(params[:id])
  end
  
  def new
    @role = Role.new
  end
  
  def edit
    @role = Role.find(params[:id])
  end
  
  def create
    @role = Role.new(params[:role])
    
    if @role.save
      flash[:success] = "Role has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
      flash[:success] = "Role was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @role = Concept.find(params[:id])
    @role.destroy
    
    flash[:success] = "Role was successfully deleted"
    redirect_to :action => :index
  end
end
