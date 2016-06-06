class RemoveAlcoholDrugsVictim < ActiveRecord::Migration
  def change
    remove_columns :victims, :effect_drugs, :effect_alcohol
  end
end
