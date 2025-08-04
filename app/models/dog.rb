class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image # ActiveStorageを設定

  validates :name, :breed, :age, :place, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  validate :profile_image_validation

  private

  def profile_image_validation
    return unless profile_image.attached?

    # サイズチェック
    if profile_image.blob.byte_size > 5.megabytes
      errors.add(:profile_image, "は5MB以下でなければなりません")
    end

    # 画像形式チェック
    acceptable_types = [ "image/jpeg", "image/png" ]
    unless acceptable_types.include?(profile_image.content_type)
      errors.add(:profile_image, "はJPEGまたはPNG形式でなければなりません")
    end
  end
end
