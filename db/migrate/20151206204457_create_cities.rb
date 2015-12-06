class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :inductor_destination
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
