class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def menu
    @mood = session[:mood]
  end

  def set_mood
    session[:mood] = params[:mood]
    redirect_to menu_path
  end
end
