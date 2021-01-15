class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if:
  :all_blank, allow_destroy: true

  validates :description, length: { minimum: 5 }
  validates :subject_id, presence: true
end
