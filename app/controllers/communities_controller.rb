class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[show edit update destroy]

  def index
    @communities = Community.all
  end

  def show
    @message = Message.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community_member = @community.community_members.build(user: current_user, owner: true)
    @community_member.community = @community
    @community_member.save
    if @community.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_path
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name)
  end
end
