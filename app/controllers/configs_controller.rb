class ConfigsController < ApplicationController
# before_action :set_config

  def index
  end

  def get
  end

  def update
      # binding.pry
      p "parametres passes a la methode #{params}"
      @config = Config.first
      @theme = Theme.find(params[:theme_id])
      # @theme = Theme.find_by(params[:theme])


      @config.theme = @theme
      @config.save
      redirect_to themes_path, notice: "Thème '#{@theme.name}' appliqué"
  end

  private

    # def set_config
    #   @config = Config.find(params[:id])
    # end

  def config_params
    params.require(:config).permit(:theme_id)
  end
end
