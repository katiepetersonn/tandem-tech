class Booking < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id", optional: true
  belongs_to :student, class_name: "User", foreign_key: "student_id", optional: true
end
