class CreateBookingsSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings_skills, id:false do |t|
      t.integer :booking_id
      t.integer :skill_id
    end
  end
end
