class City < ActiveRecord::Base
  belongs_to :state

  validates :name, presence: true, uniqueness: { scope: :state, case_sensitive: false}
end
