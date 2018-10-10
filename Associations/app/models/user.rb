class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: 'Enrollment'

  has_many :courses,
    through: :enrollments,
    source: :course

end
