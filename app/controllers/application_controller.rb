class ApplicationController < ActionController::Base

=begin

  before_action :authorized
  helper_method :logged_in?
  helper_method :current_user

  #UsersController
  skip_before_action :authorized, only: [:new, :create]

  #any other routes you'd like to skip

  def cureent_user
    User.find(id: session[:useid])
  end

  def logged_in?
    !cureent_user.nil?
  end

  def authorized
    redirect_to '/login' unless logged_in?

  end
=end

  before_action :ensure_user_logged_in

  bTechCourse = {"IT"=>"IT Engineering",
            "CE"=>"Computer Engineering",
            "CVE"=>"Civil Engineering",
            "EE"=>"Electrical Engineering",
            "ECE"=>"Electrical & Communication Engineering",
            "ME"=>"Mechanical Engineering"
            }


  $teachingSemester = Array.new([1,2,3,4,5,6,7,8])



  private

    def ensure_user_logged_in
      unless current_user_id
        flash[:alert] = "Your session time is over. Please login again."
        redirect_to root_url
      end
    end

    def current_user_id
      return @current_user if @current_user
      current_user_id = session[:current_user_id]
      if current_user_id
        @current_user = User.find(current_user_id)
      else
        nil
      end
    end

    def current_user_role
      current_user_role = session[:current_user_role]
      if current_user_role
        User.find(current_user_role)
      else
        nil
      end
    end

end
