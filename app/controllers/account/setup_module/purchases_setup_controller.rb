class Account::SetupModule::PurchasesSetupController < Account::SetupModuleController
  def index
    redirect_to account_setup_module_purchases_setup_suppliers_path
  end
end
