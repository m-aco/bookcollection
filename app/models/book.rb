class Book < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 255 }
    validates :review, presence: true, length: { maximum: 1600 }
end
