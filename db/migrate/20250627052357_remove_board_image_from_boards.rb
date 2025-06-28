class RemoveBoardImageFromBoards < ActiveRecord::Migration[7.2]
  def change
    remove_column :boards, :board_image, :string
  end
end
