# load(File.join(Rails.root, 'db', 'seeds', '04_course_category.rb'))
["Accounting", "Administration", "Agriculture and Rural", "Airlines", "Architecture and Interior Design", "Arts", "
Entertainment and Sport", "Automotive", "Banking", "Beauty and Fashion", "Building Products and Construction", "Call
Centers", "Chemical", "Childcare", "Communication", "Construction", "Consulting", "Defense", " Education",
  "Electronics", "Emergencies and Protective Services", "Energy", "Engineering", "Environment", "Fast Moving Customer
 Goods", "Finance", "Food", "Beverage and Tobacco", "Government", "Graphic Design and Multimedia", "Healthcare and
Medical", "Hospitality and Tourism", "Housing", "HR and Recruitment", "Information Management", "Insurance and Super
Annuation", "Information and Technology", "Legal", "Manufacturing", "Manufacturing Metal", "Steel", "Marketing",
"Media and Advertising", "Mining and Mineral Processing", "Oil and Gas", "Pharmaceutical and Biotech", " Public Affairs",
  "Real State and Property", "Refinery", "Research", " Retail", "Sales", "Science", "Services", "Telecommunications",
  "Timber", "Trade", "Transportation and Logistics", "Utilities", "Volunteer and Charity", "Wholesale Trade"].each do
|course_name|
  CourseCategory.create(name: course_name)
end

User.transaction do
  #Change Value
  University.create(name: 'Royal University of Bhutan', weblink: 'https://www.bhutan.edu.au', campus: 'Thimphu',
    semester_living_expenses: 5000)
  uni = University.find_by(name: 'Royal University of Bhutan')

  uni.build_focal_contact(firstname: 'John', middlename: 'Cena', lastname: 'Lincon', email: 'john@uni.canberra.edu
  .au', phone_number: '+61-998-887-776').save

  uni.build_address(street_no: '4', street_name: 'Pollock St', suburb: 'Chifley', post_code: '2606', city: 'Thimphu',
    country: 'Bhutan').save

  #create multiple faculties based on above course category name, I have created one as an example
  uni.faculties.new(code: 'ACC101', name: 'Bachelors in Accounting', course_category_id: CourseCategory.find_by(name:
    'Accounting')).save

  #create multiple users as uni_admins
  uni.users.new(email: 'Nicole@uni.canberra.edu.au', role: 'uni_admin', password: 'Selise88', faculty_id: Faculty.find_by(code: 'ACC101'),
  profile_attributes: {firstname: 'Nicole',  middlename: 'Harry', lastname: 'Dass'}, faculty_id: Faculty.find_by(code: 'ACC101'))


  #Keep these 5 lines same
  uni.criteria_rules.new(criteria: "english", weightage: 25).save
  uni.criteria_rules.new(criteria: "experience", weightage: 15).save
  uni.criteria_rules.new(criteria: "country", weightage: 10).save
  uni.criteria_rules.new(criteria: "academic", weightage: 50).save
  uni.build_experience_criteria(related_experience: 10, unrelated_experience: 5).save


  #Create Multiple Records by using the code used above in faculties
  # rank: [high_school, diploma, graduate, post_graduate, phd]
  # duration is total semesters
  faculty = Faculty.find_by(code: 'ACC101')
  faculty.courses.new(code: "MIT001", name: "Master of Information Technology", duration: 4, rank: "post_graduate",
    course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  #Create Multiple Units
  Unit.create(code: "DBMS", name: "Database Management System", credit_point: 3, level: "high_school", semester_fees: 4500)

  #Create english_competency requirement for each course
  #Keep it same
  course = Course.find_by(code: 'MIT001')
  course.english_competencies.new(competency_type: "IELTS", overall_band: 6.5, speaking: 6, reading: 6, writing: 6,
    listening: 6).save
  course.english_competencies.new(competency_type: "PTE", overall_band: 6.5, speaking: 6, reading: 6, writing: 6,
    listening: 6).save

  #Create Single academic_eligibilities
  #code=[high_school, diploma, graduate, post_graduate, phd]
  course.academic_eligibilities.new(eligibility_type: "Degree Level", minimum_score: 60, code: "graduate").save
  #Create Multiple Pre-requisite subjects
  course.subjects.new(name: "Math", percentage: 60).save

  #Create multiple units
  # level=[high_school, diploma, graduate, post_graduate, phd]
  uni.units.new( code: "DBMS", name: "Database Management System", credit_point: 3, level: "graduate").save


  #Create multiple course_unit
  # category = [optional, mendatory]
  course = Course.find_by(code: 'MIT001')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'optional').save



  #Student Creation
  # Create Alteast 10 Students
  User.new(email: 'dal@uni.canberra.edu.au', role: 'student', password: 'Selise88',
    profile_attributes: {firstname: 'Dal',  middlename: 'Bdr', lastname: 'Rai'},
    address_attributes: {street_no: '4', street_name: 'Pollock St', suburb: 'Chifley', post_code: '2606', city: 'ACT',
      country: 'Australia'}).save

  user = User.find_by(email: 'dal@uni.canberra.edu.au')
  user.english_competencies.new(competency_type: "IELTS", overall_band: 8, speaking: 8, reading: 8, writing: 8,
    listening: 8).save

  user.english_competencies.new(competency_type: "PTE", overall_band: 7, speaking: 7, reading: 6.5, writing: 7.5,
    listening: 7).save

  #create multiple qualifications
  #level= [high_school, diploma, graduate, post_graduate, phd]
  user.qualifications.new(level: "graduate", course: "B.Tech I.T", overall_percentage: 82, completed_year: "2012-04-06").save

  #create multiple subjects
  qualification = user.qualifications.find_by(level: 'graduate')
  qualification.subjects.create(name: "Programming in C", percentage: 90)

  #Create Multple experiences
  user.experiences.new(job_type: "Programmer", start: "2019-01-01 00:00:00", end: "2020-01-01 00:00:00", company:
    "Selise", responsibility: 'Web Development').save

  #create multiple course_category preferances
  user.category_preferances.new(course_category_id: CourseCategory.find_by(name:'Information Technology')).save
end
