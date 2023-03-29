class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
