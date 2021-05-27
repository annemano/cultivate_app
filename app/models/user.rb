class User < ApplicationRecord
  before_create :set_nickname

  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_nickname
    self.nickname = email.gsub(/@.*/, "")
  end
end
