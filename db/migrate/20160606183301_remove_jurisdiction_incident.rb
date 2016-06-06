class RemoveJurisdictionIncident < ActiveRecord::Migration
  def change
    remove_column :incidents, :property_jurisdiction
  end
end
