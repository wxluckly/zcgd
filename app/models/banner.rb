class Banner < ActiveRecord::Base
  mount_uploader :image, Banner::ImageUploader
end
