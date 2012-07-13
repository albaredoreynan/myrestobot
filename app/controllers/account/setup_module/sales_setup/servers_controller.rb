
class Account::SetupModule::SalesSetup::ServersController < Account::SetupModule::OrganizationSetupController
  set_tab :servers
  
  def index
    @servers = Server.order("updated_at")
    @servers_grid = initialize_grid(Server, :include => [:branch],  :name => "server_grid", :enable_export_to_csv => true, :csv_file_name => "servers")
  end
  
  def show
    @server = Server.find(params[:id])
  end
  
  def new
    @server = Server.new
  end
  
  def edit
    @server = Server.find(params[:id])
  end
  
  def create
    @server = Server.new(params[:server])
    
    if @server.save
      flash[:success] = "Server has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @server = Server.find(params[:id])

    if @server.update_attributes(params[:server])
      flash[:success] = "Server was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @server = Server.find(params[:id])
    @server.destroy
    
    flash[:success] = "Server was successfully deleted"
    redirect_to :action => :index
  end
  
end