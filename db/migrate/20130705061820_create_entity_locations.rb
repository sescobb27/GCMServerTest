class CreateEntityLocations < ActiveRecord::Migration
  def change
    create_table :entity_locations do |t|
      t.references :entity, null: false
      t.references :location, null: false

      t.timestamps
    end
    add_index :entity_locations, :entity_id
    add_index :entity_locations, :location_id
  end
end
