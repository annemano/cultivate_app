class CommunityRequestsController < ApplicationController
  def decide
    @community_request = CommunityRequest.find(params[:request])
    if params[:accept]
      @community_member = CommunityMember.new
      @community_member.user = current_user
      @community_member.community = @community_request.community
      @community_member.save
    end
    @community_request.destroy
    redirect_to communities_path
  end
end
