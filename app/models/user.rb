class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length: { maximum:255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true
    has_secure_password
    has_many :tasks
end
