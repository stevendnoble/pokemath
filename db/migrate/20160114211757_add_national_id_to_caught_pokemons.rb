class AddNationalIdToCaughtPokemons < ActiveRecord::Migration
  def change
    add_column :caught_pokemons, :national_id, :integer
  end
end
