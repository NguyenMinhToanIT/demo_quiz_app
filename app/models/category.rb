class Category < ApplicationRecord
  has_many :questions
  validates :title, presence: true,
                    length: { minimum:3 }
end
