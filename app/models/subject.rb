class Subject < ApplicationRecord
    validates :description, presence: true
    paginates_per 5
end
