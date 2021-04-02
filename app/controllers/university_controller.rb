class UniversityController < ApplicationController
  def create
    @uni = University.new(uni_params)

    if @uni.save
      render json: {message: 'University created', success: true}, status: :ok
    else
      render json: {error: {message: 'Error creating university'}, success: false}, status: :unprocessable_entity
    end
  end

  def show
    @university = University.find(params[:id])
    @user = User.uni_admin.first
  end

  def update
    if university.update_attributes(uni_params)
      render json: {message: 'University Updated', success: true}, status: :ok
    else
      invalid_resource!(university)
    end
  end

  def search
     @uni = University.find_by(token: params[:token])
     @uni.build_wallet if @uni.wallet.nil?
  end

  def activate
    @activator = UniActivator.new(uni_params)
    if @activator.activate?
      render json: {message: 'University Activated Successfully', success: true}, status: :ok
    else
      render json: {error: {message: 'Error activating university'}, success: false}, status: :unprocessable_entity
    end
  end

  def new
    @uni = University.new
    @focal_contact = @uni.build_focal_contact
    @address = @uni.build_address
  end

  private

  def university
    @university = University.find(params[:id])
  end

  def uni_params
    params
      .require(:university)
      .permit(:id, :name, :weblink, :remark, :token,
        focal_contact_attributes: [:id, :firstname, :middlename, :lastname, :email, :phone_number],
        english_competencies_attributes: [:id, :overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
          :reading],
        academic_eligibilities_attributes: [:id, :code, :eligibility_type, :minimum_score],
        address_attributes: [:id, :street_no, :street_name, :suburb, :post_code, :city, :country]
      )
  end
end
