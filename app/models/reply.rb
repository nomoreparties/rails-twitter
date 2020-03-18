class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :repliable, polymorphic: :true

  has_many :replies, as: :repliable
end
