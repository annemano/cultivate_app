class Community < ApplicationRecord
  # before_create :save_community_members
  has_many :community_members, dependent: :destroy
  has_many :users, through: :community_members

  has_many :messages, dependent: :destroy

  has_many :community_requests, dependent: :destroy
  accepts_nested_attributes_for :community_requests, reject_if: :all_blank, allow_destroy: true

  has_one :owner_member, -> { where(owner: true) }, class_name: "CommunityMember"
  has_one :owner, class_name: "User", through: :owner_member, source: :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
