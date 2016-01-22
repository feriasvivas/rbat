class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :incident

  validates :name, presence: true, uniqueness: { scope: :category, case_sensitive: false}
end
