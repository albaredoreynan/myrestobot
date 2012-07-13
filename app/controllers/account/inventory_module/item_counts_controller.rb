
class Account::InventoryModule::ItemCountsController < Account::InventoryModuleController
  set_tab :item_counts
  
  def index
    @item_counts = ItemCount.order("updated_at")
    @item_counts_grid = initialize_grid(ItemCount)
  end
  
  def show
    @item_count = ItemCount.find(params[:id])
  end
  
  def new
    @item_count = ItemCount.new
  end
  
  def edit
    @item_count = ItemCount.find(params[:id])
  end
  
  def create
    @item_count = ItemCount.new(params[:item_count])
    
    if @item_count.save
      flash[:success] = "Item count has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @item_count = ItemCount.find(params[:id])

    if @item_count.update_attributes(params[:item_count])
      flash[:success] = "Item count was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @item_count = ItemCount.find(params[:id])
    @item_count.destroy
    
    flash[:success] = "Item count was successfully deleted"
    redirect_to :action => :index
  end
end
