class Comment < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id", optional: true

end
