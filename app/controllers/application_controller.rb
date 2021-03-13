class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_color, :set_background_color


  # layout :set_layout

  private


  def set_color
    # @theme = Theme.all.joins(:configs).where(id: Config.first.theme_id).first
    @theme = Config.first.theme
  end

  def set_background_color
    # @theme = Theme.all.joins(:configs).where(id: Config.first.theme_id).first
    return Config.first.theme.background_color
  end


end
