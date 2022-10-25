class Tweet < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :like_users, through: :likes, source: :user
end
