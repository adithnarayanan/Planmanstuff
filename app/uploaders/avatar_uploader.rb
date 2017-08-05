class AvatarUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick
 
  # Choose what kind of storage to use for this uploader:
  storage :file
  #storage :fog
 
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end
 
  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [100, 100]
  end
 
  version :medium do
    process :resize_to_fill => [300, 300]
  end
 
  version :small do
    process :resize_to_fill => [140, 140]
  end
  
  version :icon do
    process :resize_to_fill => [30,30]
  end
 
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
