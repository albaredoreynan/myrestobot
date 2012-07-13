
class Account::PurchasesModule::PurchasesController < Account::PurchasesModuleController
  set_tab :purchases
  
  def index
    @purchases = Purchase.order("updated_at")
    @purchases_grid = initialize_grid(Purchase)
  end
  
  def show
    @purchase = Purchase.find(params[:id])
  end
  
  def new
    @purchase = Purchase.new
  end
  
  def edit
    @purchase = Purchase.find(params[:id])
  end
  
  def create
    @purchase = Purchase.new(params[:purchase])
    
    if @purchase.save
      flash[:success] = "Purchase has been created"
      redirect_to :action => :new
    else
      render :action => :new
    end
  end
  
  def update
    @purchase = Purchase.find(params[:id])

    if @purchase.update_attributes(params[:purchase])
      flash[:success] = "Purchase was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    
    flash[:success] = "Purchase was successfully deleted"
    redirect_to :action => :index
  end
end
