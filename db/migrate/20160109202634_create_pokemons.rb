class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :national_id
      t.string :species
      t.string :pokemon_type1
      t.string :pokemon_type2
      t.string :evolution
      t.integer :attack
      t.integer :defense
      t.integer :sp_atttack
      t.integer :sp_defense
      t.integer :speed
      t.string :sprite
      t.integer :catch_rate

      t.timestamps null: false
    end
    add_index :pokemons, :national_id
  end
end
