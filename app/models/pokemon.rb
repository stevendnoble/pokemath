class Pokemon < ActiveRecord::Base

  has_many :pokemons, through: :caught_pokemon

end
