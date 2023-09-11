class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :recruitment, foreign_key: true
      t.timestamps
    end
  end
end
