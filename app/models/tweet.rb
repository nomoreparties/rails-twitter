class Tweet < ApplicationRecord
  belongs_to :user

  has_many_attached :uploads

  has_many :replies, as: :repliable

  def self.search(input)
    if input
      where('content LIKE ?', "%#{input}%" )
    else
      Tweet.all
    end
  end
end
