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
  has_many :likes, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :apps, dependent: :destroy
  validates :name, presence: true, allow_nil: true
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :school_id, numericality: { other_than: 1 }, allow_nil: true
  validates :profile, length: { maximum: 200 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def like(app)
    Like.create!(user_id: id, app_id: app.id)
  end

  def unlike(app)
    Like.find_by(user_id: id, app_id: app.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
