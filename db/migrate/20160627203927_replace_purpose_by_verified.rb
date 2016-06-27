class ReplacePurposeByVerified < ActiveRecord::Migration
  def up
    remove_column :incidents, :purpose_id
    add_column :incidents, :verified, :boolean
    drop_table :purposes
  end

  def down
    remove_column :incidents, :verified
    create_table :purposes
    add_column :purposes, :name, :string
    add_column :incidents, :purpose_id, :integer
  end
end
