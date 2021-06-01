class CommunityMembersController < ApplicationController
  def destroy
    @community_member = CommunityMember.find_by(community: params[:id], user: current_user)
    @community_member.destroy
    redirect_to communities_path
  end
end
