class Victim < ApplicationRecord
  belongs_to :incident, optional: true
  belongs_to :severity, optional: true
  belongs_to :experience, optional: true

  def initials
    nameParts = self.name.split(' ')
    nameParts.delete_if {|x| x.start_with? 'd' and x.length < 4}
    initials = nameParts.map {|x| x[0]}
    initials.join.upcase
  end
end
