class AddInstitutionToUser < ActiveRecord::Migration[4.2]
  def change
    change_table :users do |t|
      t.references :institution, index: true
    end

  end
end
