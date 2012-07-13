class Account::ReportsModule::SalesReportsController < Account::ReportsModuleController
  set_tab :sales_reports
  
  def index
    @sales = Sale.order("updated_at")
    @sales_grid = initialize_grid(Sale, :include => :branch)
  end
  
  def show
    @sale = Sale.includes([:sale_sale_categories, :sale_settlement_types, :branch])
      .find(params[:id])
    #authorize! :show, @sale

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
      
      format.csv do
        filename = "Daily_Sales_Report"
        render_csv(filename)
      end
      
      format.pdf do
        headers['Content-Disposition'] = "attachment; filename=\"Daily_Sales_Report\""
        render :layout => false
      end 
    end
    
  end
end
