
class Account::SetupModule::InventorySetup::UnitsController < Account::SetupModule::InventorySetupController
  set_tab :units
  
  def index
    @units = Unit.order("updated_at")
    @units_grid = initialize_grid(Unit)
  end
  
  def show
    @unit = Unit.find(params[:id])
  end
  
  def new
    @unit = Unit.new
  end
  
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.save
      flash[:success] = "Unit has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @unit = Unit.find(params[:id])

    if @unit.update_attributes(params[:unit])
      flash[:success] = "Unit was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    
    flash[:success] = "Unit was successfully deleted"
    redirect_to :action => :index
  end
end
