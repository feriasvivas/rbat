class Source < ApplicationRecord
  belongs_to :incident, optional: true
  attachment :image_file
end
