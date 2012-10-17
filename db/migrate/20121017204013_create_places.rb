class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.references :guide

      t.timestamps
    end
    add_index :places, :guide_id
  end
end
