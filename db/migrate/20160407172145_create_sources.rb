class CreateSources < ActiveRecord::Migration[4.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :text
      t.string :image_file_id
      t.references :incident
      t.timestamps null: false
    end
  end
end
