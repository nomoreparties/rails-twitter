class Reply < ApplicationRecord
  belongs_to :repliable, polymorphic: :true

  has_many :replies, as: :repliable
end
