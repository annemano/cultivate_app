class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  def index
    @entries = Entry.where(user: current_user)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.mood = session[:mood] || nil
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_path(@entry)
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end

  def set_mood
    session[:mood] = params[:mood]
    redirect_to new_entry_path
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:content)
  end
end
