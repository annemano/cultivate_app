class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @entry = Entry.new
  end

  def menu
    @mood = session[:mood]
  end

  def set_mood
    session[:mood] = params[:entry][:mood]
    redirect_to menu_path
  end

  def doodle
  end
end
