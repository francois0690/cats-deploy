class FavoritesController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
  end

  def create

    # p "parametres passes a la methode #{params}"

    # check si le favoris existe deja pour cet animal

    # p "---------------------------------------"
    # p "---------------------------------------"
    # p "@user.favorites.find_by(params[:animal]).present?= #{@user.favorites.find_by(params[:animal]).present?}"
    # p "@user.favorites.find_by(params[:animal]).nil?= #{@user.favorites.find_by(params[:animal]).nil?}"


    if @user.favorites.find_by(animal_id: params[:animal_id]).present?
      p "impossible d'ajouter le favoris car il existe deja !"
    else
      @favorite = Favorite.new(user: @user, animal: set_animal)
      # ap @favorite
      @favorite.save
      p "cree le favoris pour #{@favorite.animal.name}"
    end
    # redirect_to root_path
  end

  def destroy
    # p "parametres passes a la methode #{params}"

    # p "---------------------------------------"
    # p "---------------------------------------"
    # p "@user.favorites.find_by(params[:animal]).present?= #{@user.favorites.find_by(params[:animal]).present?}"
    # p "@user.favorites.find_by(params[:animal]).nil?= #{@user.favorites.find_by(params[:animal]).nil?}"
    if @user.favorites.find_by(params[:animal]).present?
      @favorite = @user.favorites.find_by(params[:animal])
      @favorite.destroy
      # p "supprime le favoris pour #{@favorite.animal.name}"
    else
      # p "impossible de supprimer le favoris car il n'existe pas!"
    end

  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def set_user
    @user = current_user
  end

end
