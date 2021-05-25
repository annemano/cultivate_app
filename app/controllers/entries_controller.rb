class EntriesController < ApplicationController

  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_entry
  end

  def entry_params
    params.require(:entry).permit(:content)
  end
end
