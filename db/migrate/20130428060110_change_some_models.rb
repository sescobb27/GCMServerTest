class ChangeSomeModels < ActiveRecord::Migration
  def up
  	remove_column :coupons, :company_name
  	add_column :coupons, :entity_id, :integer, null: false
  	add_index :entities, :entity_name, :unique => true
  end

  def down
  	add_column :coupons, :company_name, :string, limit: 20, null: false
  	remove_column :coupons, :entity_id
  	remove_index :entities, column: :entity_name
  end
end
