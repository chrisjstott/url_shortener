class Course < ActiveRecord::Base
  has_many(
    :enrollments,
    class_name: 'Enrollment',
    foreign_key: :course_id,
    primary_key: :id
  )

  has_many(
    :enrolled_students,
    through: :enrollments,
    source: :student
  )
end
