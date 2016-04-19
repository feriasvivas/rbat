class Source < ActiveRecord::Base
  belongs_to :incident
  attachment :image_file
end
