class Blog < ApplicationRecord
  validates :shimei, :subject, :message, presence: true
  mount_uploader :img_path, ImgUploader
end
