class Album < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  validates :title, presence: true
end
