class App < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :language, presence: true
  validates :reference, presence: true
  validates :image, presence: true

  def already_liked?(user)
    likes.exists?(user_id: user.id)
  end
end
