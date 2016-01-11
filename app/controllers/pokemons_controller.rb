class PokemonsController < ApplicationController
  
  def new
  end

  def show
    @caught_pokemon = CaughtPokemon.new
    # if it is in the database, get from the database
    if @pokemon = Pokemon.find_by_national_id(params[:id])

    # otherwise get from the api
    else
      new_pokemon = Pokegem.get "pokemon", params[:id]
      parsed_pokemon = ActiveSupport::JSON.decode(new_pokemon)
      if parsed_pokemon["types"][1]
        type2 = parsed_pokemon["types"][1]["name"]
      else
        type2 = nil
      end
      if parsed_pokemon["evolutions"][0]
        evolve_to = parsed_pokemon["evolutions"][0]["name"]
      else
        evolve_to = nil
      end
      @pokemon = Pokemon.new({
                                national_id: parsed_pokemon["national_id"],
                                species: parsed_pokemon["name"],
                                pokemon_type1: parsed_pokemon["types"][0]["name"],
                                pokemon_type2: type2,
                                evolution: evolve_to,
                                attack: parsed_pokemon["attack"],
                                defense: parsed_pokemon["defense"],
                                sp_attack: parsed_pokemon["sp_atk"],
                                sp_defense: parsed_pokemon["sp_def"],
                                speed: parsed_pokemon["speed"],
                                sprite: "",
                                catch_rate: 0
                              })
      @pokemon.sprite += @pokemon.national_id.to_s + ".png"
      @pokemon.catch_rate = 600 - @pokemon.attack
      @pokemon.catch_rate -= @pokemon.defense
      @pokemon.catch_rate -= @pokemon.sp_attack
      @pokemon.catch_rate -= @pokemon.sp_defense
      @pokemon.catch_rate -= @pokemon.speed
      if @pokemon.save
        #success
      else
        #error
      end
    end
  end

  def create
  end

  private

  # def set_pokemon
  #   pokemon_id = params[:id]
  #   @pokemon = Pokemon.find_by_national_id
  # end

  # def pokemon_params
  #   params.require(:pokemon).permit(:)
  # end
end
