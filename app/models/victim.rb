class Victim < ActiveRecord::Base
  belongs_to :incident
  belongs_to :severity
  belongs_to :experience
end
