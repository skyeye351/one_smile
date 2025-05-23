class AddAvatarToBoards < ActiveRecord::Migration[7.2]
  def change
    add_column :boards, :avatar, :string
  end
end
