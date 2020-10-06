class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  attr_accessor :image_cache
  validates :title, presence: true
end
