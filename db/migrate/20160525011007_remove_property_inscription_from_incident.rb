class RemovePropertyInscriptionFromIncident < ActiveRecord::Migration
  def up
    remove_column :incidents, :property_inscription
  end

  def down
    add_column :incidents, :property_inscription, :string
  end
end
