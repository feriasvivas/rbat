class Experience < ActiveRecord::Base
  has_many :victims

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
