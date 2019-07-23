class Tuikameibo < ApplicationRecord
  belongs_to :meibo

  validates :faxnum, format: { with: /\A[0-9\-]+\z/ },
    length: {minimum: 8,maximum: 13}, allow_blank: true

  validates :mailadd, format: { 
    with: /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i
    }, allow_blank: true
end
