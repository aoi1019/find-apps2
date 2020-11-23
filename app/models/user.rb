class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  has_many :apps
  has_many :comments
  validates :name, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :school_id, numericality: { other_than: 1 } 
end