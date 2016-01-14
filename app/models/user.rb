class User < ActiveRecord::Base
  has_secure_password

  has_many :caught_pokemons, dependent: :destroy
  has_many :pokemons, through: :caught_pokemons

  validates :username, 
            presence: true,
            uniqueness: true,
            length: {minimum: 6}

end 

