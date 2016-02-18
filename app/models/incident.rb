class Incident < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :sub_category
  belongs_to :chapter
  belongs_to :purpose
  belongs_to :occurrence_factor
  belongs_to :property_usage
  has_many :victims, dependent: :destroy
end