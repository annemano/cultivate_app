class CommunitiesController < ApplicationController
  def show
    @community = Community.find(params[:id])
    @message = Message.new
  end
end
