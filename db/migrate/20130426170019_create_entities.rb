class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :entity_name, null: false, limit: 20
      t.string :entity_email, null: false, limit: 20
      t.string :entity_telephone_number, null: false, limit: 10
      t.string :entity_type, null: false
      t.integer :entity_category_id

      t.timestamps
    end
  end
end
