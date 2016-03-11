class AddLegalProceedingToVictim < ActiveRecord::Migration
  def up
    add_column :victims, :incident_report_number, :string
    add_column :victims, :process_number, :string
  end

  def down
    remove_columns :victims, :incident_report_number, :process_number
  end
end
