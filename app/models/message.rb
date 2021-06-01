class Message < ApplicationRecord
  belongs_to :community
  belongs_to :user

  has_rich_text :actiontext_content
end
