class CreateRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitments do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :area, null: false
      t.integer :people_limit, null: false
      t.integer :participants_count, null: false, default: 0

      t.timestamps
    end
  end
end
