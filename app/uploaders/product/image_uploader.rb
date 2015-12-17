class Product::ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "file/upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big do
    process resize_to_fill: [300, 300]
  end

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  version :v168x168 do
    process resize_to_fill: [168, 168]
    process :optimize
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end