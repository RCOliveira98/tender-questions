class Question < ApplicationRecord
  belongs_to :subject
  validates :description, length: { minimum: 5 }
  validates :subject_id, presence: true
end
