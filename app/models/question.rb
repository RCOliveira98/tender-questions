class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if:
  :all_blank, allow_destroy: true

  validates :description, length: { minimum: 5 }
  validates :subject_id, presence: true

  scope :select_by_description, ->(description, page) {
    includes(:answers, :subject).where("lower(description) LIKE ?", "%#{description.downcase}%").page(page)
  }

  scope :select_the_last_items, ->(page) { includes(:answers, :subject).page(page) }

  scope :select_by_subject, ->(subject_id, page) {
    includes(:answers, :subject).where(subject_id: subject_id).page(page)
  }
  
end
