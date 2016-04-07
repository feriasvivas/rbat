class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :text
      t.string :file
      t.references :incident
      t.timestamps null: false
    end
  end
end
