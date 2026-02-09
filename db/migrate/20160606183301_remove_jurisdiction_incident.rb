class RemoveJurisdictionIncident < ActiveRecord::Migration[4.2]
  def change
    remove_column :incidents, :property_jurisdiction
  end
end
