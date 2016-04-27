class RemoveSupervisorFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :supervisor
  end
end
