class App < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :name, presence: true
  validates :language, presence: true
  validates :reference, presence: true
  validates :image, presence: true
end