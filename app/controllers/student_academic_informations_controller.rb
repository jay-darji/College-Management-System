class StudentAcademicInformationsController < ApplicationController

  before_action :ensure_user_logged_in


  def index
    @academicInfos = StudentAcademicInformation.all
  end

  def new
    @academicInfo = StudentAcademicInformation.new
  end

  def create
    #if StudentAcademicInformation.find_by(:studentId => :current_user_id).nil?
    @academicInfo = StudentAcademicInformation.new(academic_params)
    @academicInfo.studentId = @current_user.id
    puts "------------"
    puts "#{@academicInfo}"
    respond_to do |format|
      if @academicInfo.department.nil?
        format.html {render :new}
      else
        if @academicInfo.save
          # if @academicInfo.department.nil?
          #   format.html{ redirect_to edit_student_academic_information_path(@academicInfo), flash: { notice: "Please add necessary details."}}
          # else
          format.html{ redirect_to user_path(session[:current_user_id]), flash: { notice: "College details updated sucessfully."}}
          format.json{ render user_path(session[:current_user_id]), status: :updated, location: :academicInfo}
        else
          format.html{ redirect_to new_student_academic_information_path, flash: { alert: "College Information not created. Please try again."}}
        end
      end
    end
  end

  def edit
    @academicInfo = StudentAcademicInformation.find(params[:id])
    puts @academicInfo
  end

  def update
    @academicInfo = StudentAcademicInformation.find(params[:id])
    @academicInfo.batch = academic_params[:batch]
    respond_to do |format|
      if @academicInfo.batch_changed?
        @academicInfo.save
        format.html{ render :edit }
        puts "---------1-----------"
      elsif @academicInfo.update(academic_params)
        format.html{ redirect_to student_academic_information_path(params[:id]) , flash: { notice: "College details updated sucessfully."}}
        format.json{ render user_path(session[:current_user_id]), status: :updated, location: :academicInfo}
      end
    end
  end

  def show
    puts "------------1-----------"
    @academicInfo = StudentAcademicInformation.find(params[:id])
  end

  def destroy
    @academicInfo = StudentAcademicInformation.find(params[:id])
    @academicInfo.destroy
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: "College details was successfully destroyed." }
      format.json { render :new , head: no_content }
    end
  end

  private
  def academic_params
    params.require(:student_academic_information).permit(:studentId, :batch, :department, :cpi, :currentSemester)
  end
end
