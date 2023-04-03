class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }

  has_many :articles
  has_many :comments
  has_many :messages

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 105 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }

  scope :all_except, ->(user) { where.not(id: user) }

  after_create_commit { broadcast_append_to "users" }

end
