class ChangeIncidentsOccurrenceFactor < ActiveRecord::Migration
  def change
    remove_column :incidents, :occurrence_factor, :integer
    add_reference :incidents, :occurrence_factor, index: true, foreign_key: true
  end
end
