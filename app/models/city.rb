class City < ActiveRecord::Base
  belongs_to :state
  has_many :Incident

  validates :name, presence: true, uniqueness: { scope: :state, case_sensitive: false}
end
