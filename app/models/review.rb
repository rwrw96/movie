class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    has_many :likes, dependent: :destroy
end
