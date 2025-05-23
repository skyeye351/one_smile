class RemoveAvatarFromBoards < ActiveRecord::Migration[7.2]
  def change
    remove_column :boards, :avatar, :string
  end
end
