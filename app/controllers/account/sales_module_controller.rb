
class Account::SalesModuleController < AccountController
  def index
    redirect_to new_account_sales_module_sale_path
  end
end
