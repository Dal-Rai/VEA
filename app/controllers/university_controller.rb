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
    @uni = University.find(token: params.permit(:token))
  end

  def update
    unless university.update_attributes(uni_params)
      invalid_resource!(university)
    end
  end

  def activate
     @uni = University.find_by(token: activate_param[:token])
  end

  def new; end

  private

  def university
    @university = University.find(params[:id])
  end

  def uni_params
    params
      .require(:university)
      .permit(:id, :name, :weblink, :remark,
        focal_contact_attributes: [:name, :email, :phone_number],
        address_attributes: [:street_no, :street_name, :suburb, :post_code, :city, :country]
      )
  end

  def activate_param
    params
      .require(:university)
      .permit(:token)
  end
end
