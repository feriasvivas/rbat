class RemovePropertyInscriptionFromIncident < ActiveRecord::Migration[4.2]
  def up
    remove_column :incidents, :property_inscription
  end

  def down
    add_column :incidents, :property_inscription, :string
  end
end
