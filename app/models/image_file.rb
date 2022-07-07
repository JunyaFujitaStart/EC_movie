class ImageFile < ApplicationRecord
  mount_uploader :file, FileUploader
end
