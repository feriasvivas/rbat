class LatitudeLongitude < ActiveRecord::Migration
  def up
    add_column :incidents, :location2, :string
  end

  def down
    remove_column :incidents, :location2
  end
end
