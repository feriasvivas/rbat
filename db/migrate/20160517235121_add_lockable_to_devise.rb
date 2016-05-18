class AddLockableToDevise < ActiveRecord::Migration
  def up
    add_column :users,  :failed_attempts, :integer, :null => false, :default => 0
    add_column :users, :locked_at, :datetime
  end

  def down
    remove_columns :users, :failed_attempts, :locked_at
  end
end
