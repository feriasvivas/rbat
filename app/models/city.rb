class City < ApplicationRecord
  belongs_to :state, optional: true
  has_many :Incident

  validates :name, presence: true, uniqueness: { scope: :state_id, case_sensitive: false}
end
