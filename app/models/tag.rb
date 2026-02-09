class Tag < ApplicationRecord
  has_and_belongs_to_many :incidents

  validates :name, presence: true, uniqueness: {case_sensitive: true}
end
