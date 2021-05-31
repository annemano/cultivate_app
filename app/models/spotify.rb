require 'oembed'

class Spotify
  include ActiveModel::Model
  include ActiveModel::Attributes
  include GlobalID::Identification
  include ActionText::Attachable

  attribute :id

  def self.find(id)
    new(id: id)
  end

  def thumbnail
    OEmbed::Providers.register_all
    resource = OEmbed::Providers.get("https://open.spotify.com/track/#{id}")
    # using existing oembed method for thumbnail url
    resource.thumbnail_url
  end

  def to_trix_content_attachment_partial_path
    "spotifies/thumbnail"
  end
end
