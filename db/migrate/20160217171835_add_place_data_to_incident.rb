class AddPlaceDataToIncident < ActiveRecord::Migration

  def change
    change_table :incidents do |t|
      t.references :property_usage
      t.string :property_jurisdiction
      t.string :property_company
      t.string :property_inscription
      t.string :tourist_guide
      t.integer :property_signaling
      t.integer :equipment_failure
      t.integer :adequacy_to_norms
    end
  end

end
