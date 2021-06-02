class MessagesController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @message = Message.new(message_params)
    @message.community = @community
    @message.user = current_user
    if @message.save
      broadcast_message
      redirect_to community_path(@community, anchor: "message-#{@message.id}")
    else
      render "communities/show"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to community_path(@message.community)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def broadcast_message
    CommunityChannel.broadcast_to(
      @community,
      render_to_string(partial: "message", locals: { message: @message })
    )
  end
end
