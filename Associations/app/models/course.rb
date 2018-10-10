class Course < ApplicationRecord
  validates :name, presence: true


  belongs_to :prereq,
    foreign_key: :prereq_id,
    primary_key: :id,
    class_name: 'Course',
    optional: true

  belongs_to :instructor,
    foreign_key: :instructor_id,
    primary_key: :id,
    class_name: 'User'

  has_many :enrollments,
  foreign_key: :course_id,
  primary_key: :id,
  class_name: 'Enrollment'

  has_many :users,
  through: :enrollments,
  source: :user

end
