class RenameSpAtttackToSpAttack < ActiveRecord::Migration
  def change
    rename_column :pokemons, :sp_atttack, :sp_attack
  end
end
