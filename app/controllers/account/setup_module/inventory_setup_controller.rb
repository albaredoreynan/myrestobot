class Account::SetupModule::InventorySetupController < Account::SetupModuleController
  def index
    redirect_to account_setup_module_inventory_setup_categories_path
  end
end
