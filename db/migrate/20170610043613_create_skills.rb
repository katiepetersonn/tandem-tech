class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.text :skill
      t.integer :booking_id
      t.integer :user_id

      t.timestamps
    end
  end
end
