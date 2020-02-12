class Post < ApplicationRecord
  mount_uploaders :image, PostImageUploader
  validates :title, presence: true
end
