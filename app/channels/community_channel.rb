class CommunityChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    community = Community.find(params[:id])
    stream_for community
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
