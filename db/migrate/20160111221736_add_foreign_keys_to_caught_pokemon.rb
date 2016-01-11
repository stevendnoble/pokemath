class AddForeignKeysToCaughtPokemon < ActiveRecord::Migration
  def change
    add_foreign_key :caught_pokemons, :users
    add_foreign_key :caught_pokemons, :pokemons
  end
end
