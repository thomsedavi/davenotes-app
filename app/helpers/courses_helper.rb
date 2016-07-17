module CoursesHelper
  def unknown?
    !CourseUser.where(course_id: @course.id, user_id: current_user.id).first
  end

  def active?
    CourseUser.where(course_id: @course.id, user_id: current_user.id).first.active?
  end

  def admin?
    CourseUser.where(course_id: @course.id, user_id: current_user.id).first.admin?
  end
end
