class Account::SetupModule::OrganizationSetupController < Account::SetupModuleController
  def index
    redirect_to account_setup_module_organization_setup_clients_path
  end
end
