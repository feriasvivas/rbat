class Incident < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :sub_category
  belongs_to :chapter
  belongs_to :occurrence_factor
  belongs_to :property_usage
  has_many :victims, dependent: :destroy
  has_many :sources, dependent: :destroy
  has_and_belongs_to_many :tags

  def tags2string
    a_tags = ''
    if tags
      tags.each do |t|
        a_tags += (t.name + '; ')
      end
    end
    a_tags
  end

  def self.list(user_id)
    user = User.find(user_id)
    case user.roles
    when 1
      incidents = self.all
    when 2
      user_ids = User.where(supervisor_id: user.id).map{ |e| e.id }
      user_ids.insert(0, user.id)
      incidents = self.where(user_id: user_ids)
    else
      incidents = self.where(user_id: user.id)
    end
    incidents
  end

end
