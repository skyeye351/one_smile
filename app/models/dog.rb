class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image # ActiveStorageを設定
end
