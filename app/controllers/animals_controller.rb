class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user! , only: [:index, :dropdown]

  helper_method :set_race, :age, :age_in_month_str, :age_in_month_int  # #, :add_photo_to_delete

  # Initialise le tableau des photos pour une animal
  # @@arr_photos = []

  def index
     p "---------------------------------------------------------"
     p "---------------------call de index-----------------------"
     p "params de search form params[:search]=#{params[:search]}"





    @user = current_user
    p "current_user=#{@user}"
    @theme = Config.first.theme

    #p params[:search]
    # p params[:search].flatten
    # binding.pry
    # hash pour ne garder que les values presentent
    if params[:search].present?

      search_hash = {}
      params[:search].each do |k, v|
        p "classe de v=#{v.class}"
        # toto = v.class
        # p toto.class
        # binding.pry
        if !v.empty?
          # search_hash[k] = v
          # binding.pry
          p "k=#{k}, v=#{v}"

          if k.to_s == "birth_date"
            # month = v.to_i
            if v == "Bébé"
              date = (Time.now - 4.months)..
            elsif v == "Junior"
              date = (Time.now - 12.months)..(Time.now - 5.months)
            elsif v == "Adulte"
              date = (Time.now - 96.months)..(Time.now - 13.months)
            else
              date = (Time.now - 1000.months)..(Time.now - 97.months)
            end
            search_hash[k] = date

            # search_hash[k] = (Time.now - v.to_i.months)..

          else
            search_hash[k] = v
          end
        end
      end

        # p params[:search]
        # p search_hash
# binding.pry
      if search_hash.size > 0
        @animals = Animal.includes([:photos_attachments]).where(search_hash).order('added_date DESC')
      else
        @animals = Animal.includes([:photos_attachments]).order('added_date DESC')
      end

      @search_res = true


    else
      #pas de recherche, affichage uniquement de index
      @animals = Animal.includes([:photos_attachments]).order('added_date DESC')
      @search_res = false
    end


  end




  def favorites
    @animals = current_user.animals.includes([:photos_attachments]).order('added_date DESC')
    @user = current_user
    @theme = Config.first.theme
  end

  def dropdown
    respond_to do |format|
      format.html
      format.json { render json:  set_race(params.fetch(:espece)) }
    end
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path, notice: "Animal ajouté"
    else
      render :new
      # render "animals/new"
    end
  end

  def destroy
    @animal.destroy
    redirect_to root_path, notice: "Animal supprimé"
  end

  def edit
    set_array_photos
  end

  def update

    # si je ne fais pas except(:photos) sur les params de update
    # il écrase les photos de l'animal par celle(s) ajoutée(s)
    if @animal.update(animal_params.except(:photos))

        # check si des photos sont supprimees de @animal
        @@arr_photos.each do |photo|
          @animal.photos.find(photo).purge
          # ap "purge #{photo}"
        end

        # check si des photos sont ajoutees dans ces nouveaux params
        if params[:animal][:photos].present?
            # new_params = animal_params
            params[:animal][:photos].each do |photo|
              @animal.photos.attach(photo)
              # p "ajoute une photo #{photo}"
            end
            # p "nombre de photos totale pour cet animal : #{@animal.photos.count}"
        end

      redirect_to root_path, notice: "Animal modifié"
    else
      redirect_to root_path, notice: "Animal non modifié"
    end


    # @animal.update(animal_params)
    # redirect_to root_path, notice: "Animal modifié"
  end

  def new
    @animal = Animal.new
    @user = current_user
  end


  def add_photo_to_delete
    # binding.pry
    p "appel de la methode add_photo_to_delete"
    # if @arr_photos.nil?
    #   @arr_photos = []
    # end
    @animal = Animal.find(params[:id])
    # p "animal en cours = #{animal.name}"
     # binding.pry
     p params[:photo]
    # binding.pry

    p "ajoute une nouvelle photo au array"
    @@arr_photos << params[:photo]

    #ap @@arr_photos

    # enregistre les photos a supprimer dans un index


    # @animal.photos.find(params[:photo]).purge
    # @animal.save

  end



  private

  def set_array_photos
    #ap "vide le tableau"
    @@arr_photos = []
    # @arr_photos << "caca"
    # ap @@arr_photos
    # binding.pry
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    # params.require(:animal).permit(:name, :description, :birth_date, :espece, :race, :sex, :sterilized, :hair, :color, :size, :added_date, :added_by, :is_available, :handicap, :cat_compatible, :dog_compatible, :child_compatible, :host_name, :contact, photos: [])
    params.require(:animal).permit(:name, :description, :birth_date, :espece, :race, :sex, :sterilized, :hair, :color, :size, :added_date, :added_by, :is_available, :handicap, :cat_compatible, :dog_compatible, :child_compatible, :host_name, :price, :contact, photos: [])
  end

  def set_race(espece)
    res = []
    case espece
    when "Chat"
      res = Animal::CAT_RACE
    when "Chien"
      res = Animal::DOG_RACE
    when "Equidé"
      res = Animal::HORSE_RACE
    when "Furet"
      res = Animal::FERRET_RACE
    when "Lapin"
      res = Animal::RABBIT_RACE
    when "Oiseau"
      res = Animal::BIRD_RACE
    when "Reptile"
      res = Animal::REPTILE_RACE
    when "Rongeur"
      res = Animal::MOUSE_RACE
    else
      res = Animal::OTHER_RACE
    end

    return res
  end

def age(dob)
    now = Time.now
    annee = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    if annee.zero?
      str_annee = ""
    elsif annee == 1
      str_annee = "#{annee} an"
    else
      str_annee = "#{annee} ans"
    end

    mois = now.month - dob.month
    if mois.zero?
      str_mois = ""
    elsif mois.positive?
      str_mois = "#{mois} mois"
    else
      str_mois = "#{12 + mois} mois"
    end

    if annee.zero?

      if mois.zero?
        str_age = "Moins de 1 mois"
      else
        str_age = str_mois
      end

    else

      if mois.zero?
        str_age = str_annee
      else
        str_age = "#{str_annee} et #{str_mois}"
      end
    end

    return str_age
  end

  def age_in_month_str(dob)
    # return the age as string
    now = Time.now
    months = (now.year - dob.year) * 12 + (now.month - dob.month)
    if months > 97
      str_age = Animal::AGE[3]
    elsif months > 13
      str_age = Animal::AGE[2]
    elsif months > 5
      str_age = Animal::AGE[1]
    else
      str_age = Animal::AGE[0]
    end

    return str_age
  end

  def age_in_month_int(dob)
    # return the age as string
    now = Time.now
    return (now.year - dob.year) * 12 + (now.month - dob.month)
  end


 end
