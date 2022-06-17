class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.xxxx
    File.read("#{Rails.root}/app/models/text.txt").chomp
  end
  
  def self.yyyy
    file = File.open("#{Rails.root}/app/models/write.txt", "w")
    file.puts("Hello, You can write your message.")
    file.close
  end
  
  def self.zzzz
    File.read("#{Rails.root}/app/models/write.txt").chomp
  end
  
  def self.read
    File.read("#{Rails.root}/app/models/myfile.txt")
  end
end
