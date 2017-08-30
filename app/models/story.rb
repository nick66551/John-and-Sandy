class Story < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates_processing_of :image
    validate :image_size_validation 
    validates_presence_of :title, :description, :place, :date
private
  def image_size_validation
    errors[:image] << "要小於 1MB 喲～" if image.size > 1.megabytes
  end
end
