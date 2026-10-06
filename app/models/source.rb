class Source < ApplicationRecord
  belongs_to :incident, optional: true
  has_one_attached :image_file
end
