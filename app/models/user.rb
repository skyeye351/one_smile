class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  # has_many :boardsは、ユーザーが複数のBoardレコードを持つことを示しています。
  # dependent: :destroyは、ユーザーが削除されたとき、関連するBoardレコードも一緒に削除される
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy

  # このメソッドは、ユーザーオブジェクトと任意のオブジェクトを比較し、そのオブジェクトの user_idがユーザーオブジェクトのidと一致するかどうかを確認します。
  def own?(object)
    id == object&.user_id
  end
end
