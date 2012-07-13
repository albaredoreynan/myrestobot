
class Account::InventoryModule::EndcountsController < Account::InventoryModuleController
  
  def index
    set_tab :endcounts
    
    @endcounts = Endcount.order("updated_at")
    @endcounts_grid = initialize_grid(Endcount)
    
    @items = Item.where("items.group != ?", "non-inventory").order("subcategory_id, name ASC")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @endcount }
      
      format.csv do
        filename = "Inventory_Item_List"
        render_csv(filename)
      end
      
      format.pdf do
        headers['Content-Disposition'] = "attachment; filename=\"Inventory_Item_List\""
        render :layout => false
      end
    end
  end
  
  def show
    set_tab :endcounts
    @endcount = Endcount.find(params[:id])
  end
  
  def new
    set_tab :endcounts_new
    
    @endcount = Endcount.new
    items = Item.where("items.group != ?", "non-inventory").order("subcategory_id, name ASC")
    items.each do |item|
      @endcount.item_counts.build({ :item_id => item.id })
    end
  end
  
  def edit
    set_tab :endcounts
    @endcount = Endcount.find(params[:id])
  end
  
  def create
    @endcount = Endcount.new(params[:endcount])
    
    if @endcount.save
      flash[:success] = "Endcount has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @endcount = Endcount.find(params[:id])

    if @endcount.update_attributes(params[:endcount])
      flash[:success] = "Endcount was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @endcount = Endcount.find(params[:id])
    @endcount.destroy
    
    flash[:success] = "Endcount was successfully deleted"
    redirect_to :action => :index
  end
end
