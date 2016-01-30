class CreateOccurrenceFactors < ActiveRecord::Migration
  def change
    create_table :occurrence_factors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
