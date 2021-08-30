class Book < ApplicationRecord
    validates :title, presence: true, length: { maximum: 255 }
    validates :review, presence: true
end
