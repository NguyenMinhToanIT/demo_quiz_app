class Question < ApplicationRecord
  belongs_to :category
  validates :question_no, :question, :answer, presence: true, length: { minimum: 1 }
end
