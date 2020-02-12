class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  validates :title, presence: true
end
