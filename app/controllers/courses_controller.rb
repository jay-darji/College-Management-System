class CoursesController < ApplicationController

  before_action :ensure_user_logged_in

  def index
    @courses = Course.all
    @facultyInfo = FacultyAcademicInformation.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @profs = User.where(role: "Professor")
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    #puts params
    @course = Course.new(course_params)

    if @course.semester != nil
      @course.semester = @course.semester.remove("[","]","\""," ")
    end
    respond_to do |format|
      if @course.department.nil?
        format.html { render :new }
      else
        if @course.save
          # format.html {redirect_to new_faculty_academic_information_path, flash[:notice] = "Please select which professor teach this course." }
          format.html { redirect_to  courses_path , flash: { notice: "Course was successfully created."} }
          format.json { render :index, status: :created, location: @course }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  def update
    @course = Course.find(params[:id])
    if course_params[:semester] != nil
      puts "-----5--------"
      course_params[:semester] = "1"
        puts course_params[:semester].to_json.remove("[","]","\""," ")
    end
    puts "=---1-------="
    puts course_params
    params = course_params
    puts "=----2------="
    puts params
    params[:semester] = params[:semester].to_json.remove("[","]","\""," ")
    puts "=----3------="
    puts params
    puts "--------------"
    respond_to do |format|
      if @course.update(params)
        format.html { redirect_to  courses_path , flash: { notice: "Course was successfully updated."} }
        format.json { render :index, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.destroy
      format.html { redirect_to courses_path, notice: "Course was successfully destroyed." }
      format.json { render :index , head: no_content }
      end
    end

  end

  private
    def course_params
      params.require(:course).permit(:courseId, :courseName,:batch, :department, :facultyId, :semester=>[] )
    end

end