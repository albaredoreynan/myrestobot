
class Account::SetupModule::SalesSetup::SettlementTypesController < Account::SetupModule::OrganizationSetupController
  set_tab :settlement_types
  
  def index
    @settlement_types = SettlementType.order("updated_at")
    @settlement_types_grid = initialize_grid(SettlementType, :include => [:concept], :name => "settlement_type_grid", :enable_export_to_csv => true, :csv_file_name => "settlement_types")
  end
  
  def show
    @settlement_type = SettlementType.find(params[:id])
  end
  
  def new
    @settlement_type = SettlementType.new
  end
  
  def edit
    @settlement_type = SettlementType.find(params[:id])
  end
  
  def create
    @settlement_type = SettlementType.new(params[:settlement_type])
    
    if @settlement_type.save
      flash[:success] = "Settlement type has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @settlement_type = SettlementType.find(params[:id])

    if @settlement_type.update_attributes(params[:settlement_type])
      flash[:success] = "Settlement type was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @settlement_type = SettlementType.find(params[:id])
    @settlement_type.destroy
    
    flash[:success] = "Settlement type was successfully deleted"
    redirect_to :action => :index
  end
  
end
