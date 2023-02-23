class FacultyAcademicInformationsController < ApplicationController

  before_action :ensure_user_logged_in

  def index
    #@FacultyCollegeInfo = FacultyAcademicInformation.all
    @Profs = User.where(role: "Professor")
  end

  def new
    @FacultyAcademicInfo = FacultyAcademicInformation.new

    #-------this is for course->prof ----------
    @courseName = Course.find(params[:courseID]).courseName
    @FacultyAcademicInfo.courseId = params[:courseID]
    @ProfsAll = User.where(role: "Professor")
    @Profs = Array.new
    @ProfsAll.each do |prof|
      @Profs.push("#{prof.id} - #{prof.firstName} #{prof.LastName}")
    end

    #-------this is for prof->course----------
    #     @FacultyCollegeInfo.facultyId = params[:profId]
    # @courses = Course.all
    # @courseName = Array.new
    # @courses.each do |course|
    #   @courseName.push(course.courseName)
    # end
    #
    #
    # # puts "--------- #{@courseName}---------"
  end


  def create
    @FacultyAcademicInfo = FacultyAcademicInformation.new(academic_params)
    puts "---------"
    #@FacultyCollegeInfo.courseId = Course.find_by(:courseName => academic_params[:courseId]).courseId
    puts @FacultyAcademicInfo.courseId
    puts "---------"
    respond_to do |format|

      if @FacultyAcademicInfo.save
        if @FacultyAcademicInfo.facultyId == nil
          format.html{ render new_faculty_academic_information_path}
          format.json{ render user_path(session[:current_user_id]), status: :updated, location: :@FacultyAcademicInfo}
        else
          format.html{ redirect_to courses_path, flash: { notice: "Courses and it's associated faculty details were added successfully."}}
          format.json{ render courses_path, status: :updated, location: :@FacultyAcademicInfo}
        end
      else
        format.html{ redirect_to user_path(session[:current_user_id]), flash: { alert: "Details were not added. Please try again."}}
      end

    end
  end

  def edit
    @FacultyAcademicInfo = FacultyAcademicInformation.find(params[:id])
    @ProfsAll = User.where(role: "Professor")
    @Profs = Array.new
    @ProfsAll.each do |prof|
      @Profs.push("#{prof.id} - #{prof.firstName} #{prof.LastName}")
    end
  end

  def update
    @FacultyAcademicInfo = FacultyAcademicInformation.find_by(params[:id])
    respond_to do |format|
      if @FacultyAcademicInfo.update(academic_params)
        format.html{ redirect_to courses_path, flash: { notice: "Courses and it's associated faculty details were updated successfully."}}
        format.json{ render courses_path, status: :updated, location: :@FacultyAcademicInfo}
      end
    end
  end

  def show
    #puts "------------1-----------"
    @FacultyAcademicInfo = FacultyAcademicInformation.find(params[:id])

  end

  def destroy
    @FacultyAcademicInfo = FacultyAcademicInformation.find(params[:id])
    @FacultyAcademicInfo.destroy
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: "College details was successfully destroyed." }
      format.json { render :new , head: no_content }
    end
  end

  private
  def academic_params
    params.require(:faculty_academic_information).permit(:facultyId, :courseId, :id)
  end
end
