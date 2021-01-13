class Question < ApplicationRecord
  belongs_to :subject
  validates :description, presence: true, length: { minimum: 5 }
  validates :subject_id, presence: true
end
