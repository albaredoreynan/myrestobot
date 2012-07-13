class Item < ActiveRecord::Base
  
  attr_accessible :name, :subcategory_id, :unit_id, :branch_id, :concept_id, :client_id
  
  attr_accessible :quantity, :cost, :group, :is_active
  
  belongs_to :subcategory
  belongs_to :unit
  
  belongs_to :concept
  
  has_many :purchase_items, :dependent => :destroy
  has_many :purchases, :through => :purchase_items
  
  has_many :item_counts, :dependent => :destroy
  has_many :endcounts, :through => :item_counts
  
  scope :item_group, where('items.group  != ?', 'non-inventory')
  def available_units
    units = [ unit ]
    Conversion.where(:smaller_unit_id => unit.id).each do |conversion|
      units << conversion.bigger_unit
    end
    return units
  end

end
