class AddAttrToNewModels < ActiveRecord::Migration
  def change
      add_column :types, :type_name, :string, null: false, limit: 15
      add_column :types, :type_description, :string
      add_column :categories, :category_name, :string, null: false, limit: 15
      add_column :categories, :category_description, :string
      add_column :entity_categories, :entity_id, :integer, null: false
      add_column :entity_categories, :category_id, :integer, null: false
      add_index :entity_categories, :entity_id
  end
end
