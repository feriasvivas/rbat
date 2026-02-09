class Severity < ApplicationRecord
  has_many :victims

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
