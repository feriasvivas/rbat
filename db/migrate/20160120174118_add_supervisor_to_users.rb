class AddSupervisorToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean 'supervisor', null: false, default: false
    end
  end
end
