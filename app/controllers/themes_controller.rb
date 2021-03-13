class ThemesController < ApplicationController
before_action :set_theme, only: [:show, :edit, :update, :destroy]


def index
  # @themes = Theme.all
  @themes = Theme.includes([:logo_attachment, :avatar_attachment]).order('updated_at DESC')
  @config = Config.first
# binding.pry

end

def create
  p "create"
  @theme = Theme.new(theme_params)
  if @theme.save
    redirect_to themes_path, notice: "Theme ajouté"
  else
    render :new
  end
end

def destroy
  p "destroy"
  @theme.destroy
  redirect_to themes_path, notice: "Thème supprimé"
end

def edit

end

def update
  p "update"
  if params[:theme][:remove_pdf].present?
    @theme.remove_pdf!
    @theme.save
  end

  @theme.update(theme_params)
  redirect_to themes_path, notice: "Thème modifié"
end

def new
  @theme = Theme.new
end

# def add_pdf_to_delete
#     # binding.pry
#     p "appel de la methode add_pdf_to_delete"
#     set_theme


#   end


private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name, :basic_description, :full_description, :email, :phone, :address, :legal_mention, :siret_number, :twitter_url, :facebook_url, :instagram_url, :background_color, :logo, :avatar, :pdf)
  end

end

# t.string :name
# t.string :basic_description
# t.string :full_description
# t.string :email
# t.string :phone
# t.string :address
# t.string :background_color
