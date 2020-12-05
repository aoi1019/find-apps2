class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  has_one_attached :image
  has_many :apps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :sns_credentials
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

  def favorite(app)
    Favorite.create!(user_id: id, app_id: app.id)
  end

  def unfavorite(app)
    Favorite.find_by(user_id: id, app_id: app.id).destroy
  end

  def favorite?(app)
    !Favorite.find_by(user_id: id, app_id: app.id).nil?
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def self.search(keyword)
    if keyword
      where(['name LIKE ?', "%#{keyword}%"])
    else
      all
    end
  end

  # def self.search(school)
  #   if school
  #     where(['id', "%#{school}%"])
  #   else
  #     all
  #   end
  # end
end