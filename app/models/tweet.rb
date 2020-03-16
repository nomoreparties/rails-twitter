class Tweet < ApplicationRecord
  belongs_to :user

  has_many_attached :uploads

  has_many :replies
end
