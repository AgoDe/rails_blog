class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { minimum: 1, maximum: 255 }
  validates :user_id, presence: true

  after_create_commit { broadcast_append_to room }

  before_create :confirm_partecipant

  def confirm_partecipant
    if self.room.is_private
      is_partecipant = Partecipant.where(user_id: self.user_id, room_id: self.room_id).first
      throw(:abort) unless is_partecipant
    end
  end


end
