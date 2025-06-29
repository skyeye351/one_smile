class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # アップロードされていない場合のデフォルト画像
  def default_url
    "/sample.jpg"
  end

  # セキュリティ対策：不正なファイルのアップロードを防ぐ
  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
