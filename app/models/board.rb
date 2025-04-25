class Board < ApplicationRecord
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true, length: { maximum: 65_535 }

    # BoardモデルのレコードをUserモデルのレコードと関連付ける
    belongs_to :user

    # 画像のアップロードや取得が簡単にできる設定
    mount_uploader :board_image, BoardImageUploader
end
