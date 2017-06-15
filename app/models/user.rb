class User < ApplicationRecord
  has_secure_password
  # has_many :skills
  has_many :comments
  has_many :teacher_bookings, :foreign_key => "teacher_id", :class_name => "Booking"
  has_many :student_bookings, :foreign_key => "student_id", :class_name => "Booking"

  enum state: [ :teacher, :student, :both ]

  def self.search(search)
    self.where("name ILIKE ? OR skills ILIKE ?", "%#{search}%", "%#{search}%")
  end

end

# 0 - teacher
# 1 - student
# 2 - both
