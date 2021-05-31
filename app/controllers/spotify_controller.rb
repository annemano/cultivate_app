class SpotifyController < ApplicationController
  def show
    @spotify = Spotify.new(id: params[:id])
    render json: {
      sgid: @spotify.attachable_sgid,
      content: render_to_string(partial: "spotifies/thumbnail", locals: { spotify: @spotify }, formats: [:html])
    }
  end
end
