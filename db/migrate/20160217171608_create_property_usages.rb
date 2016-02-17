class CreatePropertyUsages < ActiveRecord::Migration
  def change
    create_table :property_usages do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
