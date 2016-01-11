class CreateCaughtPokemons < ActiveRecord::Migration
  def change
    create_table :caught_pokemons do |t|
      t.string :name
      t.integer :user_id
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end
