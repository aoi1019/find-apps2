class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  has_one_attached :image
  has_many :apps, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :school_id, numericality: { other_than: 1 }
end