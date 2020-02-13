class Album < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  validates :title, presence: true
end
