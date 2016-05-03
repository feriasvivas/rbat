class AddInstitutionToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :institution, index: true
    end

  end
end
