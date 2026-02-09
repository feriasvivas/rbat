class AddSupervisorToUsers < ActiveRecord::Migration[4.2]
  def change
    change_table :users do |t|
      t.boolean 'supervisor', null: false, default: false
    end
  end
end
