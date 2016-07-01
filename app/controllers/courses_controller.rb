class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def new
    @school = School.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    @course.school_id = params[:id]

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def index
    @school = School.find(params[:id])

    render plain: @school.courses.inspect
  end

  private
  def course_params
    params.require(:course).permit(:code, :title)
  end

end
