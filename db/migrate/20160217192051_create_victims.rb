class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.references :severity
      t.integer :effect_alcohol
      t.integer :effect_drugs
      t.integer :physically_challenged
      t.references :experience
      t.references :incident
      t.timestamps null: false
    end
  end
end
