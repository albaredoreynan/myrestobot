class CreateSettlementTypes < ActiveRecord::Migration
  def change
    create_table :settlement_types do |t|
      t.string :name
      t.boolean :is_complimentary
      t.integer :concept_id
      
      t.timestamps
    end
    
    add_index :settlement_types, :concept_id
  end
end
