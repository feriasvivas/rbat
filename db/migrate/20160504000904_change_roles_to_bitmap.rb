class ChangeRolesToBitmap < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up { t.change :roles, :integer, :default => 0 }
        dir.down { t.change :roles, :string, :default => "--- []"}
      end
    end
  end
end
