class Purchase < ActiveRecord::Base
  
  belongs_to :supplier
  belongs_to :branch
  belongs_to :concept
  belongs_to :client
  belongs_to :client_user
  
  has_many :purchase_items, :dependent => :destroy
  has_many :items, :through => :purchase_items
  
  attr_accessible :supplier_id, :branch_id, :concept_id, :client_id, :creator_id
  
  attr_accessible :purchase_date, :invoice_number, :purchase_items_attributes
  
  accepts_nested_attributes_for :purchase_items, :reject_if => :all_blank, :allow_destroy => :true
  
  def amount
    purchase_items.map(&:amount).inject(:+) || 0.00
  end

  def net_amount
    purchase_items.map(&:net_amount).inject(:+) || 0.00
  end

  def vat_amount
    purchase_items.map(&:vat_amount).reject(&:nil?).inject(:+) || 0.00
  end
  
end
