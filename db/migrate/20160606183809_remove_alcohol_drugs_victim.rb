class RemoveAlcoholDrugsVictim < ActiveRecord::Migration[4.2]
  def change
    remove_columns :victims, :effect_drugs, :effect_alcohol
  end
end
