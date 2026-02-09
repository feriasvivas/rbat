class AddEasyRolesToUsers < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :roles, :integer, :default => 0
  end

  def self.down
    remove_column :users, :roles
  end
end
