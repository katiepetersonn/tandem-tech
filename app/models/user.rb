class User < ApplicationRecord
  has_secure_password
  # has_many :skills
  has_many :comments
  has_many :bookings

  enum state: [ :teacher, :student, :both ]

  def self.search(search)
    self.where("name ILIKE ?", "%#{search}%")
  end

end

# 0 - teacher
# 1 - student
# 2 - both
