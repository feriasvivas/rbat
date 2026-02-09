class RemoveSupervisorFromUser < ActiveRecord::Migration[4.2]
  def change
    remove_column :users, :supervisor
  end
end
