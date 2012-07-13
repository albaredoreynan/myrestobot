
class Account::SetupModule::SalesSetup::SaleCategoriesController < Account::SetupModule::OrganizationSetupController
  set_tab :sale_categories
  
  def index
    @sale_categories = SaleCategory.order("updated_at")
    @sale_categories_grid = initialize_grid(SaleCategory, :include => [:concept], :name => "sale_category_grid", :enable_export_to_csv => true, :csv_file_name => "sale_categories")
  end
  
  def show
    @sale_category = SaleCategory.find(params[:id])
  end
  
  def new
    @sale_category = SaleCategory.new
  end
  
  def edit
    @sale_category = SaleCategory.find(params[:id])
  end
  
  def create
    @sale_category = SaleCategory.new(params[:sale_category])
    
    if @sale_category.save
      flash[:success] = "Sale category has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @sale_category = SaleCategory.find(params[:id])

    if @sale_category.update_attributes(params[:sale_category])
      flash[:success] = "Sale category was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @sale_category = SaleCategory.find(params[:id])
    @sale_category.destroy
    
    flash[:success] = "Sale category was successfully deleted"
    redirect_to :action => :index
  end
  
end
