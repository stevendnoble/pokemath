class CaughtPokemon < ActiveRecord::Base

  belongs_to :user
  belongs_to :pokemon

  validates :name, presence: true
  validates :national_id, uniqueness: true
end
