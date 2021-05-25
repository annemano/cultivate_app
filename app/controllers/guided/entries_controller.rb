class Guided::EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @questions = Question.all.sample(3)
  end

  def create
  end
end
