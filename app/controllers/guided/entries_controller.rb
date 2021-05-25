class Guided::EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @questions = Question.all.sample(3)
  end

  def create
    redirect_to edit_entry_path(@entry)
  end
end
