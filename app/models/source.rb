class Source < ActiveRecord::Base
  belongs_to :incident
  mount_uploader :file, FileUploader
end
