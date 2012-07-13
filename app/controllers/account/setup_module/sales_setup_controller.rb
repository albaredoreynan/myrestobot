class Account::SetupModule::SalesSetupController < Account::SetupModuleController
  def index
    redirect_to account_setup_module_sales_setup_sale_categories_path
  end
end
