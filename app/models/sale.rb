class Sale < ActiveRecord::Base
  
  attr_accessible :branch_id, :sale_date, :sale_sale_categories_attributes, :vat, :service_charge, 
                  :sale_settlement_types_attributes, :cash_in_drawer, :gc_redeemed, :delivery_sales, 
                  :customer_count, :transaction_count, :delivery_transaction_count, :credit_card_transaction_count, :gc_sales, 
                  :other_income, :sale_settlement_id, :sale_sale_category_id
  
  has_many :sale_sale_categories
  has_many :sale_categories, :through => :sale_sale_categories
  
  has_many :sale_settlement_types
  has_many :settlement_types, :through => :sale_settlement_types
  
  has_many :sale_servers
  has_many :servers, :through => :sale_servers
  
  accepts_nested_attributes_for :sale_sale_categories
  accepts_nested_attributes_for :sale_settlement_types
  
  belongs_to :branch, :class_name => 'Branch'
  
  def category_total
    sale_sale_categories.map(&:amount).reject(&:nil?).inject(:+).to_f || 0
  end

  def settlement_type_total
    sale_settlement_types.map(&:amount).reject(&:nil?).inject(:+) || 0
  end

  def server_sale_total
    sale_servers.map(&:amount).reject(&:nil?).inject(:+) || 0
  end

  def net_sales
    category_total.to_i
  end

  def total_revenues
    category_total.to_i + vat.to_i + service_charge.to_i
  end

  def total_settlement_type_sales
    #settlement_type_total + gc_redeemed + delivery_sales 
    settlement_type_total.to_i + gc_redeemed.to_i + delivery_sales.to_i + cash_in_drawer.to_i 
  end

  def cash_for_deposit
    cash_in_drawer.to_i + gc_sales.to_i + other_income.to_i
    #gc_sales + other_income
  end

  def per_person_ave
    (net_sales / customer_count).round(2) unless customer_count.to_i == 0
  end

  def per_trans_ave
    (net_sales / transaction_count).round(2) unless transaction_count.to_i == 0
  end
  
  def month_to_date
    Sale.find(:all, :conditions => ['sale_date >= ? and sale_date <= ?', Date.today.beginning_of_month, Date.today] )
  end
  
  def month_to_date_customer_count
    month_to_date.map(&:customer_count).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_transaction_count
    month_to_date.map(&:transaction_count).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_delivery_sales
    month_to_date.map(&:delivery_sales).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_cash_in_drawer
    month_to_date.map(&:cash_in_drawer).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_gc_sales
    month_to_date.map(&:gc_sales).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_other_income
    month_to_date.map(&:other_income).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_vat
    month_to_date.map(&:vat).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_gc_redeemed
    month_to_date.map(&:gc_redeemed).reject(&:nil?).inject(:+) || 0
  end
  
  def month_to_date_service_charge
    month_to_date.map(&:service_charge).reject(&:nil?).inject(:+) || 0
  end

  def month_to_date_cash_for_deposit
    month_to_date_cash_in_drawer + month_to_date_gc_sales + month_to_date_other_income
  end
end
