class Severity < ActiveRecord::Base
  has_many :victim

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
