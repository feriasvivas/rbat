class SubCategory < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, uniqueness: { scope: :category, case_sensitive: false}
end
