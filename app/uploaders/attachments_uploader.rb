# encoding: utf-8

class AttachmentsUploader < CarrierWave::Uploader::Base


  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  # Call method
  process :set_content_type

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def watermark(watermark_image, options = {})
    cache_stored_file! if !cached?
    Watermarker.new(current_path, watermark_image).watermark!(options)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :thumb, :if => :image? do
    process :resize_to_limit => [200, 200]
  end

  version :medium, :if => :image? do 
    process :resize_to_limit => [400, 400]
  end

  version :large, :if => :image? do
    process :resize_to_limit => [1200, 800]
    process :watermark => [Rails.root.join('app/assets/images/logo_sem_nome_mini.png')]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png pdf txt)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  protected
    def image?(new_file)
      new_file.content_type.start_with? 'image'
    end


end