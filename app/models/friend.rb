class Friend < ApplicationRecord
  belongs_to :friend, class_name: "Friend", optional: true
  belongs_to :user
end