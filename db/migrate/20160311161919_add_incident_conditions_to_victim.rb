class AddIncidentConditionsToVictim < ActiveRecord::Migration
  def up
    add_column :victims, :equipment, :integer
    add_column :victims, :tourist_imprudence, :integer
    add_column :victims, :guide_malpractice, :integer
    add_column :victims, :guide_negligence, :integer
    add_column :victims, :climate_conditions, :integer
  end

  def down
    remove_columns :victims, :equipment, :tourist_imprudence, :guide_negligence, :guide_malpractice, :climate_conditions
  end
end
