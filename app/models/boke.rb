class Boke < ApplicationRecord
  validates :boke, presence: true, length: { maximum: 255 }
end
