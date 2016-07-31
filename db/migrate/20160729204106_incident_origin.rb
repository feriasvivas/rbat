class IncidentOrigin < ActiveRecord::Migration
  def up
    add_column :incidents, :information_origin, :string
  end

  def down
    remove_column :incidents, :information_origin
  end
end
