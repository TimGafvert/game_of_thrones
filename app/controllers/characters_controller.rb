class CharactersController < ApplicationController

  def index
    @house = House.find(params[:house_id])
    @characters = @house.characters.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @house = House.find(params[:house_id])
    @character = Character.new
  end

  def create
    @house = House.find(params[:house_id])
    @character = @house.characters.create!(character_params)
    redirect_to house_character_path(@house, @character)
  end

  def edit
    @character = Character.find(params[:id])
    @house = @character.house
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to house_character_path(@house, @character)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to "/houses"
  end

  private
  def character_params
    params.require(:character).permit(:name)
  end

end
