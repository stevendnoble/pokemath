class CaughtPokemon < ActiveRecord::Base

  belongs_to :user
  belongs_to :pokemon

  validates :name, presence: true
end
