class Source < ApplicationRecord
  belongs_to :incident
  attachment :image_file
end
