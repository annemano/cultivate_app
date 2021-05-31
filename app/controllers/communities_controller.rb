class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[show edit update destroy]

  def index
    @communities = current_user.communities
  end

  def show
    @message = Message.new
  end

  def new
    @community = Community.new
    @non_owner_users = User.where.not(id: current_user.id).map { |u| [u.nickname, u.id] }
  end

  def create
    @community = Community.new(community_params)
    @community.community_members.build(user: current_user, owner: true)
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
    params.require(:community).permit(:name, community_members_attributes: %i[id user_id _destroy])
  end
end
