class App < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 300 }
  validates :point, length: { maximum: 140 }
  validates :language, presence: true, length: { maximum: 50 }
  validates :reference, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :period, numericality: { only_integer: true }

  def already_liked?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search(keyword)
    if keyword
      where(['name LIKE ? OR language LIKE ?', "%#{keyword}%", "%#{keyword}%"])
    else
      all
    end
  end
end
