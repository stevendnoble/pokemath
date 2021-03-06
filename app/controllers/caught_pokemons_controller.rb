class CaughtPokemonsController < ApplicationController
  before_action :authorize
  before_action :set_pokemon, only:[:show,:destroy]
  
  def create
    caught_pokemon = CaughtPokemon.new(caught_pokemon_params)
    pokemon = Pokemon.find_by_national_id(caught_pokemon_params[:national_id])
    if current_user.pokemons.include?(pokemon)
      flash[:error] = "You can only have one of each species of pokemon!"
      redirect_to map_path
    else
      caught_pokemon.save
      flash[:notice] = "New pokemon in your pokedex!"
      redirect_to map_path
    end
  end

  def show
    @pokemon = Pokemon.find_by_id(@caught_pokemon.pokemon_id);
  end

  def destroy
    if @caught_pokemon.user_id == current_user.id
      @caught_pokemon.destroy
      flash[:notice] = "You let your best friend go."
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
      flash[:error] = "Not your pokemon!"
    end
  end

  private

  def set_pokemon
    @caught_pokemon = CaughtPokemon.find(params[:id]);
  end

  def caught_pokemon_params
    params.require(:caught_pokemon).permit(:name, :user_id, :pokemon_id, :national_id)
  end
end
