class Account::PurchasesModuleController < AccountController
  def index
    redirect_to new_account_purchases_module_purchase_path
  end
end