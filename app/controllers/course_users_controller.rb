class CourseUsersController < ApplicationController
  def new
    @course = Course.find(params[:course])
    @course_user = CourseUser.new(course: @course, user: current_user)
    @course_user.save
    redirect_to @course
  end
end
