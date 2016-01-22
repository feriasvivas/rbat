class Incident < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :sub_category
  belongs_to :Chapter
  belongs_to :Purpose
end
