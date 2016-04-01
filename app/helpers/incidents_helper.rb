module IncidentsHelper
  def tags2string tags
    a_tags = ''
    if tags
      tags.each do |t|
        a_tags += (t.name + ' ')
      end
    end
    a_tags
  end

end
