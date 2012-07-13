class Account::PurchasesModule::PurchaseItemsController < Account::PurchasesModuleController
  set_tab :purchases
  autocomplete :item, :name, :full => true
  
  def index
    @purchase_items = PurchaseItems.order("updated_at")
    @purchase_items_grid = initialize_grid(PurchaseItem, :include => [:purchase])
  end
  
  def show
    @purchase_item = PurchaseItems.find(params[:id])
  end
  
  def new
    @purchase_item = PurchaseItems.new
  end
  
  def edit
    @purchase_item = PurchaseItems.find(params[:id])
  end
  
  def create
    @purchase_item = PurchaseItems.new(params[:purchase_item])
    
    if @purchase_item.save
      flash[:success] = "Purchase item has been created"
      redirect_to :action => :new
    else
      render :action => :new
    end
  end
  
  def update
    @purchase_item = PurchaseItems.find(params[:id])

    if @purchase_item.update_attributes(params[:purchase_item])
      flash[:success] = "Purchase item was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @purchase_item = PurchaseItems.find(params[:id])
    @purchase_item.destroy
    
    flash[:success] = "Purchase item was successfully deleted"
    redirect_to :action => :index
  end
end
