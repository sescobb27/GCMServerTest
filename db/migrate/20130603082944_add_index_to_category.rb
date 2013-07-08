class AddIndexToCategory < ActiveRecord::Migration
  def change
    add_index :categories, :category_name, unique: true
    add_index :coupons, :entity_id, unique: false
    add_index :entity_categories, :entity_id, unique: false
    add_index :entity_categories, :category_id, unique: false
    add_index :entities, :entity_email, unique: true
    add_index :receivers, :user_id, unique: true
    add_index :type_categories, :type_id, unique: false
    add_index :type_categories, :category_id, unique: false
    add_index :types, :type_name, unique: true
    add_index :user_entities, :user_id, unique: false
    add_index :user_entities, :entity_id, unique: false
    add_index :users, :name, unique: true
  end
end
