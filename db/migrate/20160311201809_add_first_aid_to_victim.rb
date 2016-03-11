class AddFirstAidToVictim < ActiveRecord::Migration
  def up
    add_column :victims, :first_aid_conducted, :integer
    add_column :victims, :first_aid_equipment, :integer
    add_column :victims, :staff_trained_in_first_aid, :integer
    add_column :victims, :doctor_on_call, :integer
  end

  def down
    remove_columns :victims, :first_aid_conducted, :first_aid_equipment, :staff_trained_in_first_aid, :doctor_on_call
  end
end
