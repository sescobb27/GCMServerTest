class CreateCategoryTypes < ActiveRecord::Migration
  def change
    create_table :category_types do |t|

      t.timestamps
    end
  end
end
