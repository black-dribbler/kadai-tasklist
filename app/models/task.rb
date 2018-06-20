class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
  validates :status, presence: true, length: { maximum: 10 }
end
