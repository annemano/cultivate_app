class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  def index
    @entries = Entry.where(user: current_user).sort_by &:created_at
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.mood = session[:mood] || nil
    if @entry.save
      redirect_to entries_path
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
      redirect_to entries_path
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end

  def share
    @community = Community.find(params[:community_id])
    @entry = Entry.find(params[:id])
    @message = Message.new(actiontext_content: @entry.content, community: @community, user: current_user)
    if @message.save
      redirect_to community_path(@community, anchor: "message-#{@message.id}")
    else
      render "communities/show"
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:content)
  end
end
