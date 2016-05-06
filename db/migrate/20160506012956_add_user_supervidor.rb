class AddUserSupervidor < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up { t.references :supervisor, index: true }
        dir.down { t.remove_reference :supervisor, index: true }
      end
    end
  end
end
