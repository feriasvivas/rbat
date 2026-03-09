class Victim < ApplicationRecord
  belongs_to :incident, optional: true
  belongs_to :severit, optional: true
  belongs_to :experienc, optional: true

  def initials
    nameParts = self.name.split(' ')
    nameParts.delete_if {|x| x.start_with? 'd' and x.length < 4}
    initials = nameParts.map {|x| x[0]}
    initials.join.upcase
  end
end
