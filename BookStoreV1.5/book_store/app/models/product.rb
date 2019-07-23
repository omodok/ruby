class Product < ApplicationRecord
  validates :syohin, :taisyo, :hontai, :tyosya, :teisai, :naiyo, presence: true
  mount_uploader :img_path, ImgUploader
end