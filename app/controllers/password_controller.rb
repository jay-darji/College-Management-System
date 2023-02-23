class PasswordController < ApplicationController

  before_action :ensure_user_logged_in

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts "---------======---------"
    puts @user
    #puts @user
    respond_to do |format|
      if @user.update(password_params)
        format.html { redirect_to user_url(@user), notice: " Password was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity, notice: "Password is not updated." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
