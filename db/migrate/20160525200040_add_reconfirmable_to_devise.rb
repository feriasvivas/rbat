class AddReconfirmableToDevise < ActiveRecord::Migration[4.2]
  def up
    add_column :users, :unconfirmed_email, :string
  end

  def down
    remove_column :users, :unconfirmed_email
  end
  
end
