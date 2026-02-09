class RemPhysicalyChalenged < ActiveRecord::Migration[4.2]
  def change
    remove_column :victims, :physically_challenged
  end
end
