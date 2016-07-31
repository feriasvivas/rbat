class RemPhysicalyChalenged < ActiveRecord::Migration
  def change
    remove_column :victims, :physically_challenged
  end
end
