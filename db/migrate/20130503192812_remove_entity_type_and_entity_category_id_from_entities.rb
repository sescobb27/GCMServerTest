class RemoveEntityTypeAndEntityCategoryIdFromEntities < ActiveRecord::Migration
  def up
      remove_column :entities, :entity_category_id
      remove_column :entities, :entity_type
  end

  def down
      add_column :entities, :entity_category_id, :integer
      add_column :entities, :entity_type, :string , null: false
  end
end
