class Board < ApplicationRecord
    # mount_uploader :board_image, BoardImageUploader
    has_one_attached :board_image # ActiveStorageを設定

    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true, length: { maximum: 65_535 }

    # BoardモデルのレコードをUserモデルのレコードと関連付ける
    belongs_to :user
    has_many :comments, dependent: :destroy

end
