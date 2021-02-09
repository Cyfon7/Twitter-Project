class Friend < ApplicationRecord
  has_many :followers, class_name: "Friend", foreign_key: "friend_id", dependent: :destroy
  belongs_to :friend, class_name: "Friend", optional: true
  belongs_to :user
end