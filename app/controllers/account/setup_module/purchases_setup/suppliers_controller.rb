
class Account::SetupModule::PurchasesSetup::SuppliersController < Account::SetupModule::OrganizationSetupController
  set_tab :suppliers
  
  def index
    @suppliers = Supplier.order("updated_at")
    @suppliers_grid = initialize_grid(Supplier, :name => "supplier_grid", :enable_export_to_csv => true, :csv_file_name => "suppliers")
  end
  
  def show
    @supplier = Supplier.find(params[:id])
  end
  
  def new
    @supplier = Supplier.new
  end
  
  def edit
    @supplier = Supplier.find(params[:id])
  end
  
  def create
    @supplier = Supplier.new(params[:supplier])
    
    if @supplier.save
      flash[:success] = "Supplier has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update_attributes(params[:supplier])
      flash[:success] = "Supplier was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    
    flash[:success] = "Supplier was successfully deleted"
    redirect_to :action => :index
  end
  
end
