class Pokemon < ActiveRecord::Base

  has_many :caught_pokemons
  has_many :users, through: :caught_pokemons

end
