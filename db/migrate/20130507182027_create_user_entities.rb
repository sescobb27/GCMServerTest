class CreateUserEntities < ActiveRecord::Migration
  def change
    create_table :user_entities do |t|
      t.integer :user_id, null: false
      t.integer :entity_id, null: false

      t.timestamps
    end
  end
end
