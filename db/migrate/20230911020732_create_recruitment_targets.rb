class CreateRecruitmentTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitment_targets do |t|
      t.belongs_to :recruitment, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
