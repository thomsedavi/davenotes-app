class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    @course = Course.find(params[:id])
    @school = School.find(@course.school_id)
    @course_users = CourseUser.where(course: @course, active: false)
  end

  def new
    @school = School.find(params[:id])
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.school_id = params[:id]

    if @course.save
      @course_user = CourseUser.new(course: @course, user: @current_user, active: true, admin: true)
      @course_user.save

      redirect_to @course
    else
      render 'new'
    end
  end

  private

  def course_params
    params.require(:course).permit(:code, :title)
  end

end
