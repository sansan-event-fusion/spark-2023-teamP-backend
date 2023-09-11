class CreateRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_users do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
