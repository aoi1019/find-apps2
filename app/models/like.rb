class Like < ApplicationRecord
  belongs_to :user
  belongs_to :app

  validates_uniqueness_of :app_id, scope: :user_id
end
