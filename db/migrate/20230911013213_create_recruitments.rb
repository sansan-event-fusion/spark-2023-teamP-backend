class CreateRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitments do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :area, null: false
      t.int :people_limit, null: false
      t.int :participants_count, null: false

      t.timestamps
    end
  end
end
