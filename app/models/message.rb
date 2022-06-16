class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.xxxx
  File.read("#{Rails.root}/app/models/text.txt").chomp
  end
end
