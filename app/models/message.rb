class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1, maximum: 255 }
  validates :user_id, presence: true
end
