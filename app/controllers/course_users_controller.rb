class CourseUsersController < ApplicationController
  before_action :admin_user, only: [:edit]

  def new
    @course = Course.find(params[:course])
    @course_user = CourseUser.new(course: @course, user: current_user)
    @course_user.save
    @notification = Notification.new(course: @course, message: 'application for edit', controller: 'courses', target: @course.id)
    @notification.save
    redirect_to @course
  end

  def edit
    @course_user = CourseUser.find(params[:id])
    @course = @course_user.course
    if params[:method] == 'delete'
      @course_user.destroy
    elsif params[:method] == 'confirm'
      @course_user.active = true
      @course_user.save
    end
    redirect_to @course
  end
end
