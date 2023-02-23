class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new

  end

  def create
    #puts params[:email]
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      session[:current_user_role] = @user.role
      # flash[:notice] = "Successfully Logged in."
      # redirect_to user_path(@user)
      @college_info = StudentAcademicInformation.find_by(:studentId => current_user_id)
      puts "--------------------1-----------------------"
      puts "#{@college_info}"
      puts "--------------------2-----------------------"
      respond_to do |format|
        if @user.role=="Student" && @college_info.nil?
          format.html { redirect_to new_student_academic_information_path, notice: "Successfully Logged in." }
        else
          if @user.role=="Student" && @college_info.department.nil?
            format.html { redirect_to edit_student_academic_information_path(@college_info), notice: "Successfully Logged in." }
          else
            format.html {redirect_to user_path(@user), notice: "Successfully Logged in."}
          end
        end

          #format.html { redirect_to new_student_academic_information_path, notice: "Successfully Logged in." }
        format.json { render :users_path, status: :created, location: @user }
      end
    else
      flash[:error] = "Invalid Credentials"
      #redirect_to new_session_path
      respond_to do |format|
        #format.html { render  , notice: "Email or password is invalid" }
        format.html { render :new, status: :unprocessable_entity, flash: {:notice => "Invalid Credentials"} }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
        #format.json { render json: @session.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    session.delete(:current_user_id)
    session.delete(:current_user_role)
    @current_user = nil

    respond_to do |format|
      format.html { redirect_to root_path, notice: "successfully signed out." }
      format.json { render root_path , head: no_content }
    end
  end
end
