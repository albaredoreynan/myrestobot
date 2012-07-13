
class Account::SetupModule::InventorySetup::ItemsController < Account::SetupModule::InventorySetupController
  load_and_authorize_resource
  
  set_tab :items
  
  def index
    @items = Item.order("updated_at")
    @items_grid = initialize_grid(Item)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def create
    @item = Item.new(params[:item])
    
    if @item.save
      @item.client_id = @item.concept.client.id
      @item.save
      flash[:success] = "Item has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      flash[:success] = "Item was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    
    flash[:success] = "Item was successfully deleted"
    redirect_to :action => :index
  end
  
  def available_units
    @item = Item.find(params[:id])
    @available_units = @item.available_units
    render :json => @available_units
  end
end
