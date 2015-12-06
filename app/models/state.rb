class State < ActiveRecord::Base
  has_many :cities

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
