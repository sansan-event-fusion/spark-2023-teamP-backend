class CreateRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitments do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
