class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :date
      t.integer :teacher_id
      t.integer :student_id
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
