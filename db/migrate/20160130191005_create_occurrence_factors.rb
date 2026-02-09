class CreateOccurrenceFactors < ActiveRecord::Migration[4.2]
  def change
    create_table :occurrence_factors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
