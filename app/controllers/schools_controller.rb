class SchoolsController < ApplicationController
  def index
    if params[:search]
      schools = School.search(params[:search])
    else
      schools = School.all
    end
    @schools = schools.where(:active => true).paginate(:page => params[:page], :per_page => 5).order('name ASC, country ASC')
  end

  def show
    @school = School.find(params[:id])
    if params[:search]
      courses = @school.courses.search(params[:search])
    else
      courses = @school.courses.all
    end
    @courses = courses.paginate(:page => params[:page], :per_page => 5).order('code ASC, title ASC')
  end

  def new

  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      if params[:commit] == "Preview"
        render 'edit'
      else
        @school.update(:active => true)
        redirect_to @school
      end
    else
      render 'edit'
    end
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to schools_path
  end

  private
  def school_params
    params.require(:school).permit(:name, :country, :website, :primary_colour,
                                   :secondary_colour, :text_colour)
  end
end
