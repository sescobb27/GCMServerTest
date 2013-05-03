class CreateTypeCategories < ActiveRecord::Migration
  def change
    create_table :type_categories do |t|
      t.integer :type_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
