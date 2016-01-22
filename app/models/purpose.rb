class Purpose < ActiveRecord::Base
  has_many :incident

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
