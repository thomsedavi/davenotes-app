class CoursesController < ApplicationController
  def index
  end

  def show
    @course = Course.find(params[:id])
    @school = School.find(@course.school_id)
  end

  def new
    @school = School.find(params[:id])
    @course = Course.new
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

  private
  def course_params
    params.require(:course).permit(:code, :title)
  end

end
