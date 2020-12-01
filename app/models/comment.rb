class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :app
  validates :content, presence: true, length: { maximum: 50 }
end
