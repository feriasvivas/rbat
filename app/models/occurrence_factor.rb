class OccurrenceFactor < ApplicationRecord
  has_many :incident

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
