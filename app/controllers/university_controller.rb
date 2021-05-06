class UniversityController < ApplicationController
  require 'will_paginate/array'

  def create
    @uni = University.new(uni_params)

    if @uni.save
      flash[:success] = "University created successfully"
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
      flash[:success] = "University details updated successfully"
    else
      flash[:danger] = university.errors.messages
    end
    redirect_to(controller: :users, action: :show, id: current_user.id, params:{type: 'university'})
  end

  def search
    if params[:token].present?
     @uni = University.find_by(token: params[:token])
     @uni.build_wallet if @uni.present? && @uni.wallet.nil?
    end
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
    @address = @uni.build_address(street_no: '', suburb: '', post_code: '')
  end

  def add_criteria
    type =  params[:type].keys.first
    form = SelectionCriteriaForm.new(current_user, send(type+'_params'), type, params[:criteria])

    if form.save
      flash[:success] = 'Saved Successfully'
    else
      flash[:danger] = form.errors.messages
    end
  end

  def reload
    if params[:type].eql?('rule')
      criteria = CriteriaRule.find_by(id: params[:type_id])
      criteria.destroy unless criteria.nil?
    elsif params[:type].eql?('english')
      english = EnglishCompetency.find_by(id: params[:type_id])
      english.destroy unless english.nil?
    elsif params[:type].eql?('experience')
      experience = ExperienceCriteria.find_by(id: params[:type_id])
      experience.destroy unless experience.nil?
    elsif params[:type].eql?('qualification')
      qualification = QualificationCriteria.find_by(id: params[:type_id])
      qualification.destroy unless qualification.nil?
    elsif params[:type].eql?('country')
      country = CountryCriteria.find_by(id: params[:type_id])
      country.destroy unless country.nil?
    elsif params[:type].eql?('subject')
      subject = Subject.find_by(id: params[:type_id])
      subject.destroy unless subject.nil?
    end
    flash[:success] = 'Delete Successful'

    if params[:course_id].present?
      redirect_to(controller: :course, action: :show, id: params[:course_id], params:{type: 'english'})
    end
  end

  def prospective_student
    qualification_ids = User.student.map(&:highest_qualification_id).compact
    students = User.student.joins(:qualifications).where('qualifications.id IN (?) AND level = ?',qualification_ids, 4)
    @students = students.paginate(:page=> params[:page], per_page: 4)
  end

  def filter_student
    qualification_ids = User.student.map(&:highest_qualification_id).compact
    students = User.student.joins(:qualifications).where('qualifications.id IN (?) AND level = ?',qualification_ids,
      CONSTANTS[params[:criteria]])

    students = students.select{|u| u.calc_weightage(current_user.university)}
    students = students.sort_by{|m| m.total_weightage}.reverse!
    @students = students.paginate(:page=> params[:page], per_page: 4)
  end

  def application
    @courses = Course.joins(:faculty, :application_progresses).where('faculties.university_id = ?', params[:id]).uniq
                 .paginate(:page=> params[:page], per_page: 2)
  end

  private

  def university
    @university = University.find(params[:id])
  end

  def english_params
    params[:university][:english_competency]
      .permit(:id, :overall_band, :competency_type, :speaking, :listening, :writing, :reading)
  end

  def experience_params
    params[:university][:experience_criteria]
      .permit(:related_experience, :unrelated_experience, :description)
  end

  def qualification_params
    params[:university][:qualification_criteria]
      .permit(:qualification_type, :weightage, :description)
  end

  def rule_params
    params[:university][:criteria_rule].permit(:weightage, :description)
  end

  def country_params
    params[:university][:country_criteria].permit(:country, :weightage, :description)
  end

  def uni_params
    params
      .require(:university)
      .permit(:id, :name, :weblink, :remark, :token, :campus, :semester_living_expenses,
        focal_contact_attributes: [:id, :firstname, :middlename, :lastname, :email, :phone_number],
        english_competencies_attributes: [:id, :overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
          :reading],
        academic_eligibilities_attributes: [:id, :code, :eligibility_type, :minimum_score],
        address_attributes: [:id, :street_no, :street_name, :suburb, :post_code, :city, :country],
        selection_criterias: [:id, :criteria_type, :weightage, :description],
        country_weightages: [:id, :country, :weightage, :description]
      )
  end
end
