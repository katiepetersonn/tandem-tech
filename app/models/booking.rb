class Booking < ApplicationRecord

  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id", optional: true
  belongs_to :student, class_name: "User", foreign_key: "student_id", optional: true

  # Stripe
  has_many :sales

  validates_numericality_of :price,
    greater_than: 50,
    message: "must be at least 50 cents"

end
