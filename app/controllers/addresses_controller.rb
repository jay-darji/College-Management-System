class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.userId = @current_user.id
    respond_to do |format|
      if @address.save
        format.html{ redirect_to user_path(session[:current_user_id]), flash: { notice: "Address details updated sucessfully."}}
        format.json{ render user_path(session[:current_user_id]), status: :updated, location: :@academicInfo}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    respond_to do |format|
      if @address.update(address_params)
        format.html{ redirect_to user_path(session[:current_user_id]), flash: { notice: "Address details updated sucessfully."}}
        format.json{ render user_path(session[:current_user_id]), status: :updated, location: :@academicInfo}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address = Address.find_by(userId: current_user_id)
    @address.destroy
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: "Address details was successfully destroyed." }
      format.json { render :new , head: no_content }
    end
  end


  private
    def address_params
      params.require(:address).permit(:houseNo, :nameOfSocietyOrAppartment, :landmark, :city, :district, :state, :nation, :postalCode, :userId)
    end
end
