class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :room, foreign_key: true
      t.string :body, null: false
      t.timestamps
    end
  end
end
