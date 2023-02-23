class ParentalInformationsController < ApplicationController

  def new
    @parentInfo = ParentalInformation.new
  end

  def create
    #puts "------------1-----------"
    @parentInfo = ParentalInformation.new(parent_params)
    # puts "------------2-----------"
    @parentInfo.userId = @current_user.id

    respond_to do |format|
      if @parentInfo.save
        format.html{ redirect_to user_path(@current_user), flash: { notice: "Parental details updated sucessfully."}}
        format.json{ render user_path(@current_user), status: :created, location: :@academicInfo}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parentInfo.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @parentInfo = @current_user.parental_information
  end

  def update
    @parentInfo = @current_user.parental_information
    # puts "-----------------", parent_params
    respond_to do |format|
      if @parentInfo.update(parent_params)
        format.html{ redirect_to user_path(@current_user), flash: { notice: "Parental details updated sucessfully."}}
        format.json{ render user_path(@current_user), status: :updated, location: :@academicInfo}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parentInfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @parentInfo = @current_user.parental_information
    #@parentInfo = ParentalInformation.find_by(userId: current_user_id)
    @parentInfo.destroy
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: "Parental details was successfully destroyed." }
      format.json { render :new , head: no_content }
    end
  end

  private
    def parent_params
      params.require(:parental_information).permit(:fatherName, :motherName, :fatherMobileNo, :motherMobileNo)
    end
end
