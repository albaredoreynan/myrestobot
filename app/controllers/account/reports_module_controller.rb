class Account::ReportsModuleController < AccountController
  def index
    redirect_to account_reports_module_purchases_reports_path
  end
end
