class Like < ApplicationRecord
    belongs_to :publication, polymorphic: true
end
