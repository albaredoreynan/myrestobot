
class Account::SetupModule::InventorySetup::ConversionsController < Account::SetupModule::InventorySetupController
  set_tab :conversions
  
  def index
    @conversions = Category.order("updated_at")
    @conversions_grid = initialize_grid(Conversion)
  end
  
  def show
    @conversion = Conversion.find(params[:id])
  end
  
  def new
    @conversion = Conversion.new
  end
  
  def edit
    @conversion = Conversion.find(params[:id])
  end
  
  def create
    @conversion = Conversion.new(params[:conversion])
    
    if @conversion.save
      flash[:success] = "Conversion has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @conversion = Conversion.find(params[:id])

    if @conversion.update_attributes(params[:conversion])
      flash[:success] = "Conversion was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @conversion = Conversion.find(params[:id])
    @conversion.destroy
    
    flash[:success] = "Conversion was successfully deleted"
    redirect_to :action => :index
  end
end
