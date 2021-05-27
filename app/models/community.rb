class Community < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :community_users, dependent: :destroy
end
