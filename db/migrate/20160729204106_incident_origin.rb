class IncidentOrigin < ActiveRecord::Migration[4.2]
  def up
    add_column :incidents, :information_origin, :string
  end

  def down
    remove_column :incidents, :information_origin
  end
end
