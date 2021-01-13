class Subject < ApplicationRecord
    has_many :questions
    validates :description, presence: true
    paginates_per 10
end
