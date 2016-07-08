module IncidentsHelper
  def tags2string tags
    a_tags = ''
    if tags
      tags.each do |t|
        a_tags += (t.name + '; ')
      end
    end
    a_tags
  end

  def initials name
    nameParts = name.split(' ')
    nameParts.delete_if {|x| x.start_with? 'd' and x.length < 4}
    initials = nameParts.map {|x| x[0]}
    initials.join.upcase
  end

end
