class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :breed
      t.integer :age
      t.string :place
      t.string :profile_image

      t.timestamps
    end
  end
end
