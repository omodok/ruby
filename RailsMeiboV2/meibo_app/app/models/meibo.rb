class Meibo < ApplicationRecord
  validates :shimei, :jusyo, presence: true
  
  validates :shimei, :jusyo, format: {
    with: /\A[^!"#$%&'()\*\+\.,\/:;<=>?@\[\\\]^_`{|}~]+\z/
  }, allow_blank: true
  
  validates :denwa,format: { with: /\A[0-9\-]+\z/ },
    length: {minimum: 8,maximum: 13}, allow_blank: true
    
end
