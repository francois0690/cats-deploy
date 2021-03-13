class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  helper_method :age#, :favorite?

  # def favorite?(cat)
  #   if user_signed_in?
  #   # return true if like set
  #   # return false if unlike set
  #     return !Favorite.where(cat_id: cat.id, user_id: current_user.id).empty?
  #   else
  #     return false
  #   end

  # end


  def home
    # @animals = Animal.all
    @animals = Animal.includes([:photos_attachments]).order('updated_at DESC')

    @user = current_user


    @theme = Config.first.theme
  end


# def favorites
#     # @animals = Animal.all
#     @animals = current_user.animals.includes([:photos_attachments])
# # current_user.cats.all

#     # @animals.order('created_at DESC').limit(6)
#     # @theme = Theme.first
#     @user = current_user


#     # @theme = Theme.all.joins(:configs).where(id: Config.first.theme_id).first
#     @theme = Config.first.theme
#   end

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
end
