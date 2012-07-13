
class Account::SetupModule::InventorySetup::SubcategoriesController < Account::SetupModule::InventorySetupController
  set_tab :subcategories
  
  def index
    @subcategories = Subcategory.order("updated_at")
    @subcategories_grid = initialize_grid(Subcategory)
  end
  
  def show
    @subcategory = Subcategory.find(params[:id])
  end
  
  def new
    @subcategory = Subcategory.new
  end
  
  def edit
    @subcategory = Subcategory.find(params[:id])
  end
  
  def create
    @subcategory = Subcategory.new(params[:subcategory])
    
    if @subcategory.save
      flash[:success] = "Subcategory has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update_attributes(params[:subcategory])
      flash[:success] = "Subcategory was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy
    
    flash[:success] = "Subcategory was successfully deleted"
    redirect_to :action => :index
  end
end
