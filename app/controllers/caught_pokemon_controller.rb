class CaughtPokemonController < ApplicationController
  def create
    @caught_pokemon = CaughtPokemon.new(caught_pokemon_params)
    if @caught_pokemon.save
      redirect_to caught_pokemon_path(@caught_pokemon)
    else
      flash[:error] = @caught_pokemon.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def show
  end

  def destroy
  end

  private

  def caught_pokemon_params
    params.require(:caught_pokemon).permit(:name, :user_id, :pokemon_id)
  end
end
