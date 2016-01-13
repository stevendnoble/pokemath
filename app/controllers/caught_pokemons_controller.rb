class CaughtPokemonsController < ApplicationController
  def create
    @caught_pokemon = CaughtPokemon.new(caught_pokemon_params)
    if @caught_pokemon.save
      redirect_to map_path
    else
      flash[:error] = @caught_pokemon.errors.full_messages.join(', ')
      redirect_to map_path
    end
  end

  def show
    @caught_pokemon = CaughtPokemon.find(params[:id]);
    @pokemon = Pokemon.find_by_id(@caught_pokemon.pokemon_id);

  end

  def destroy
  end

  private

  def caught_pokemon_params
    params.require(:caught_pokemon).permit(:name, :user_id, :pokemon_id)
  end
end
