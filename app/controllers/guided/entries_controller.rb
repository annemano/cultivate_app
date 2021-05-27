class Guided::EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @questions = Question.all.sample(3)
  end

  def create
    @guided_entry_builder = Guided::EntryBuilder.new(answers: answers_params, user: current_user, mood: session[:mood] || nil)
    if @guided_entry_builder.submit
      redirect_to edit_entry_path(@guided_entry_builder.entry)
    else
      render :new
    end
  end

  private

  def answers_params
    params.permit(guided_entry_builder: {})[:guided_entry_builder].values
  end
end
