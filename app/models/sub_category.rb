class SubCategory < ApplicationRecord
  belongs_to :category, optional: true
  has_many :incident

  validates :name, presence: true, uniqueness: { scope: :category_id, case_sensitive: false}
end
