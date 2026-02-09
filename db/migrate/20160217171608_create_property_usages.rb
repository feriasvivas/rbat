class CreatePropertyUsages < ActiveRecord::Migration[4.2]
  def change
    create_table :property_usages do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
