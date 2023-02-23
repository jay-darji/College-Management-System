class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  # GET /users or /users.json
  #has_one :user

  skip_before_action :ensure_user_logged_in , only: [:new, :create]

  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json

  def show
    @user = User.find(params[:id])
    @address = @user.address
    @parentInfo = @user.parental_information
    # @address = Address.find_by(userId: current_user_id )
    # @parentInfo = ParentalInformation.find_by(userId: current_user_id)
    # @academicInfo = StudentAcademicInformation.find_by(studentId: current_user_id)

    if @user.role == "Student"
      @academicInfo = @user.student_academic_information
      if @academicInfo != nil && @academicInfo.currentSemester != nil
        @courses = Course.where('batch= ? and FIND_IN_SET(?,semester)>0',@academicInfo.batch,@academicInfo.currentSemester)
      else
        @courses = nil
      end
    elsif @user.role == "Professor"
      @academicInfo = @user.faculty_academic_information
      if !(@academicInfo.empty?)
        @courses = Array.new
        @academicInfo.each do |eachCourse|
          @courses.push(eachCourse.course)
        end
      end
      #@courses = @user.faculty_academic_information
    end
      puts @courses
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #@user = User.where(id: params[:id]).select(:id, :firstName,:middleName,:LastName,:mobileNo,:email)
    @user = User.find(params[:id])
    @param = params[:what]
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      #if @user.password.changed?
      if @user.save
        format.html { redirect_to  sign_in_path , flash: { notice: "User was successfully created."} }
        format.json { render new_session_path, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    #@user = User.where(id: params[:id]).select(:firstName,:middleName,:LastName,:mobileNo,:email)
    @user = User.find(params[:id])
    @param = params[:commit].split(" ")[-1].downcase
    puts "------1---------"
    puts @param
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Your #{@param} Updated successfully." }
        format.json { render :show, status: :ok, location: @user }
      else
        puts "------2---------"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

=begin
    puts params
    if params[:what]=="information"
      notice = "Your information was updated successfully."
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: notice }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:what]=="password"
      notice = "Your password was updated successfully."
      respond_to do |format|
        if @user.update(password_params)
          format.html { redirect_to user_url(@user), notice: notice }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
=end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
=begin
    if @user.present?
      @user.destroy
    end
=end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: "User was successfully destroyed." }
      format.json { render :new , head: no_content }
    end
  end

=begin
  def passwordUpdate
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstName, :middleName, :LastName, :mobileNo, :email, :password, :role, :password_confirmation, :gender)
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end


end
