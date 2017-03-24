class Victim < ActiveRecord::Base
  belongs_to :incident
  belongs_to :severity
  belongs_to :experience

  def initials
    nameParts = self.name.split(' ')
    nameParts.delete_if {|x| x.start_with? 'd' and x.length < 4}
    initials = nameParts.map {|x| x[0]}
    initials.join.upcase
  end
end
