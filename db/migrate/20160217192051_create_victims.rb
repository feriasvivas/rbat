class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.string :age
      t.string :gender, limit: 1
      t.references :severities
      t.integer :effect_alcohol
      t.integer :effect_drugs
      t.integer :physically_challenged
      t.references :experiences
      t.timestamps null: false
    end
  end
end
