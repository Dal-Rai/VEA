
["Accounting", "Administration", "Agriculture and Rural", "Airlines", "Architecture and Interior Design", "Arts", "
Entertainment and Sport", "Automotive", "Banking", "Beauty and Fashion", "Building Products and Construction", "Call
Centers", "Chemical", "Childcare", "Communication", "Construction", "Consulting", "Defense", " Education",
  "Electronics", "Emergencies and Protective Services", "Energy", "Engineering", "Environment", "Fast Moving Customer
 Goods", "Finance", "Food", "Beverage and Tobacco", "Government", "Graphic Design and Multimedia", "Healthcare and
Medical", "Hospitality and Tourism", "Housing", "HR and Recruitment", "Information Management", "Insurance and Super
Annuation", "Information and Technology", "Legal", "Manufacturing", "Manufacturing Metal", "Steel", "Marketing",
  "Media and Advertising", "Mining and Mineral Processing", "Oil and Gas", "Pharmaceutical and Biotech", " Public Affairs",
  "Real State and Property", "Refinery", "Research", " Retail", "Sales", "Science", "Services", "Telecommunications",
  "Timber", "Trade", "Transportation and Logistics", "Utilities", "Volunteer and Charity", "Wholesale Trade"]

User.transaction do
  #Change Value
  University.create(name: 'University of Canberra', weblink: 'https://www.canberra.edu.au', campus: 'Canerra', semester_living_expenses: 5000)
  uni = University.find_by(name: 'University of Canberra')

  uni.build_focal_contact(firstname: 'John', middlename: 'Cena', lastname: 'Lincon', email: 'john@uni.canberra.edu.au', phone_number: '+61-998-887-776').save

  uni.build_address(street_no: '11', street_name: 'Kirinari St', suburb: 'Bruce', post_code: '2617', city: 'Canberra', country: 'Australia').save

  #create multiple faculties based on above course category name, I have created one as an example
  uni.faculties.new(code: 'ACC101', name: 'Accounting', course_category_id: CourseCategory.find_by(name:
    'Accounting').id).save

  uni.faculties.new(code: 'ICT102', name: 'Information and Technology', course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  uni.faculties.new(code: 'MAA103', name: 'Media and Advertising', course_category_id: CourseCategory.find_by(name:
    'Media and Advertising').id).save

  uni.faculties.new(code: 'HAT104', name: 'Hospitality and Tourism', course_category_id: CourseCategory.find_by(name:
    'Hospitality and Tourism').id).save

  uni.faculties.new(code: 'ENG111', name: 'Engineering', course_category_id: CourseCategory.find_by(name:
    'Engineering').id).save

  uni.faculties.new(code: 'HLT115', name: 'Health', course_category_id: CourseCategory.find_by(name: "Information Management").id).save

  uni.faculties.new(code: 'EAS113', name: 'Entertainment and Sports', course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

uni.faculties.new(code: 'BAF121', name: 'Beauty and Fashion', course_category_id: CourseCategory.find_by(name:
  'Beauty and Fashion').id).save

  uni.faculties.new(code: 'GDM122', name: 'Graphic Design and Multimedia', course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save


  #create multiple users as uni_admins
  uni.users.new(email: 'Nicole@uni.canberra.edu.au', role: 'uni_admin', password: 'Selise88',
faculty_id: Faculty.find_by(code: 'ACC101'), profile_attributes: {firstname: 'Nicole',  middlename: 'Harry',
      lastname: 'Dass'}, faculty_id: Faculty.find_by(code: 'ACC101').id)

uni.users.new(email: 'Prabhu@uni.canberra.edu.au', role: 'uni_admin', password: 'Dhan2021',
  profile_attributes: {firstname: 'Prabhu',  middlename: 'Dhan',
    lastname: 'Gurung'}, faculty_id: Faculty.find_by(code: 'ICT102').id)

uni.users.new(email: 'Dalbdr@uni.canberra.edu.au', role: 'uni_admin', password: 'Raidb2021',
faculty_id: Faculty.find_by(code: 'MAA103').id, profile_attributes: {firstname: 'Dal',  middlename: 'Bdr', lastname:
    'Rai'})

  uni.users.new(email: 'Namgay@uni.canberra.edu.au', role: 'uni_admin', password: 'Wangn2021',
    faculty_id: Faculty.find_by(code: 'HAT104').id, profile_attributes: {firstname: 'Namgay',  middlename: 'Wang',
      lastname: 'Wangdi'})

  uni.users.new(email: 'Dipesh@uni.canberra.edu.au', role: 'uni_admin', password: 'Dipshe22',
    faculty_id: Faculty.find_by(code: 'ENG111').id, profile_attributes: {firstname: 'Dipesh',  middlename: 'Kumar',
      lastname: 'Shrestha'})

  uni.users.new(email: 'Kaka@uni.canberra.edu.au', role: 'uni_admin', password: 'Kaka2202',
    faculty_id: Faculty.find_by(code: 'ICT102').id, profile_attributes: {firstname: 'Dipesh',  middlename: 'Kumar',
      lastname: 'Shrestha'})

  uni.users.new(email: 'Petersh@uni.canberra.edu.au', role: 'uni_admin', password: 'Petssh99',
    faculty_id: Faculty.find_by(code: 'EAS113').id, profile_attributes: {firstname: 'Peter',  middlename: 'Sara',
      lastname: 'Sholay'})

  uni.users.new(email: 'Chelseamt@uni.canberra.edu.au', role: 'uni_admin', password: 'Chelmt33',
    faculty_id: Faculty.find_by(code: 'BAF121').id, profile_attributes: {firstname: 'Chelsea',  middlename: 'Marry',
lastname: 'Turnbull'})

uni.users.new(email: 'Chelseamt@uni.canberra.edu.au', role: 'uni_admin', password: 'Chelmt33',
faculty_id: Faculty.find_by(code: 'GDM122').id, profile_attributes: {firstname: 'Chelsea',  middlename: 'Marry',
    lastname: 'Turnbull'})



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
  faculty.courses.new(code: "MAC001", name: "Master in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "BOA002", name: "Bachelor of Accounting", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "BOC003", name: "Bachelor of Commerce", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "BOB004", name: "Bachelor Business", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "GDA011", name: "Graduate Diploma in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "GCA012", name: "Graduate Certificate in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "MOPA0013", name: "Master of Professional Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "MIA014", name: "Major in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "CMCA015", name: "Core Major in Commerce and Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty = Faculty.find_by(code: 'ICT102')
  faculty.courses.new(code: "MIT001", name: "Master of Information Technology", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "MITS002", name: "Master of Information Technology System", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "BITS001", name: "Bachelor in Information Technology System", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "BIT002", name: "Bachelor in Information Technology ", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "BBI003", name: "Bachelor in Business Informatics ", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "BIT002", name: "Bachelor in Software Engineering", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "MDS005", name: "Master of Data Science", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "BIT011", name: "Master of Business Informatics", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "MOE0113", name: "Master of Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty = Faculty.find_by(code: 'MAA103')
  faculty.courses.new(code: "BCM121", name: "Bachelor of Communication and Media", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "BOD122", name: "Bachelor of Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "MCM123", name: "Master of Communication and Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "BOA124", name: "Bachelor of Arts (Film production)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "BVCD125", name: "Bachelor of Visual Communication Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "MPC126", name: "Master in Political Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "MIC127", name: "Master in Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "DIC128", name: "Diploma in Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "BCBM129", name: "Bachelor of Communication and Media Marketing", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save


  faculty = Faculty.find_by(code: 'HAT104')
  faculty.courses.new(code: "BETM131", name: "Bachelor of Event and Tourism Management", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "MAT132", name: "Master of Arts in Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "BMEM133", name: "Breadth Major in Event and Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "CMTM134", name: "Core Major in Event and Tourism Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "BMEM135", name: "Breadth Major in Event and Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save
  faculty = Faculty.find_by(code: 'ENG111')
  faculty.courses.new(code: "MAE141", name: "Master of Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "BOE142", name: "Bachelor of Engineering", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "BLD143", name: "Bachelor of Landscape Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "MECM144", name: "Minor in Engineering and Construction Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "BCET145", name: "Bachelor of Civil Engineering Technology", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "MICE146", name: "Major in Civil Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty = Faculty.find_by(code: 'HLT115')
  faculty.courses.new(code: "BHS151", name: "Bachelor of Health Science", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: "Healthcare and Medical").id).save

  faculty.courses.new(code: "BHHM152", name: "Bachelor of Health Science (Human Movement)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "BHSN153", name: "Bachelor of Health Science (Nutrition)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "MPH154", name: "Master of Public Health", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "BIN155", name: "Bachelor in Nursing", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "BOP156", name: "Bachelor of Physiotherapy", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "BOMW157", name: "Bachelor of Midwifery", duration: 4, rank:
    "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "BOPY158", name: "Bachelor of Pharmacy", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "MOP159", name: "Master of Physiotherapy", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "DOH160", name: "Diploma of Health", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save


  faculty = Faculty.find_by(code: 'EAS113')
  faculty.courses.new(code: "BSEC161", name: "Bachelor of Sport and Exercise Science", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "BEPR162", name: "Bachelor of Exercise Physiology and Rehabilitation", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "BSEP163", name: "Bachelor of Secondary Education (Health and Physical Education)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "MHPE164", name: "Major in Health and Physical Education", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "MSM165", name: "Major in Sport Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "MSS166", name: "Major in Sport Science", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "MSB167", name: "Major in Sport Business", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "SMSM168", name: "Specialist Major in Sports Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "MSM169", name: "Major in Sports Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty = Faculty.find_by(code: 'BAF121')
  faculty.courses.new(code: "BCI171", name: "Bachelor of Creative Industries", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "SMAF172", name: "Specialist Major in Applied Fashion", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "MAFT173", name: "Minor in Applied Fashion Technology", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "MDI174", name: "Major in Design Identity", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "BCID175", name: "Bachelor of Creative Industries (Drama & Performance)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "MCM176", name: "Major in Contemporary Musicianship", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "SMDP177", name: "Specialist Major in Drama and Performance", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save


  faculty = Faculty.find_by(code: 'BAF121')
  faculty.courses.new(code: "MIM181", name: "Major in Multimedia", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "BAD182", name: "Bachelor of Arts and Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "MGD183", name: "Major in Graphic Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "MGDS184", name: "Major in Graphic Design Studio", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "DID185", name: "Diploma in Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "BOD186", name: "Bachelor of Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "BMDM187", name: "Breadth Major in Digital Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "MIDDP188", name: "Major in Digital Design and Production", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "SMGD189", name: "Specialist Major in Game Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  #Create Multiple Units
  Unit.create(code: " PPIT", name: "Professional Practice in IT", credit_point: 3, level: "high_school", semester_fees: 4500)

  Course.all.each do |course|
    course.english_competencies.new(competency_type: "IELTS", overall_band: 6.5, speaking: 6, reading: 6, writing: 6, listening: 6).save
    course.english_competencies.new(competency_type: "PTE", overall_band: 6.5, speaking: 6, reading: 6, writing: 6, listening: 6).save
  end

  Course.graduate.each do |course|
    course.academic_eligibilities.new(eligibility_type: "High School", minimum_score: 60, code: "high_school").save
  end

  Course.post_graduate.each do |course|
    course.academic_eligibilities.new(eligibility_type: "High School", minimum_score: 60, code: "high_school").save
    course.academic_eligibilities.new(eligibility_type: "Under Graduate", minimum_score: 60, code: "graduate").save
  end

  #Create multiple units
  # level=[high_school, diploma, graduate, post_graduate, phd]
  uni.units.new(code: "DBMS", name: "Database Management System", credit_point: 3, level: "graduate").save

  uni.units.new(code: "PPIT", name: "Professional Practice in IT", credit_point: 3, level: "graduate").save

  uni.units.new(code: "SPQM", name: " System Project and Quality Management ", credit_point: 3, level: "graduate").save

  uni.units.new(code: "SSIT", name: " Security and Support in IT", credit_point: 3, level: "graduate").save

  uni.units.new(code: "WDAP", name: "Web Design and Programming", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "IIT", name: "Introduction to Information Technology", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DDN", name: "Database Design", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "ITNE", name: "Introduction to Network Engineering", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "TEM", name: "Technology and Engineering Managment", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "CNS", name: "Computer and Network Security", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "SNA", name: "System and Network Administration", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "ITDS", name: "Introduction to Data Science", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "ECC", name: "Enterprise and Cloud Computing", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "SAM", name: "System Analysis and Modelling", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "ARTP", name: "Advanced Real Time Production", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "IGP", name: "Introduction to Games Production", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "3DG", name: "3D Graphics", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DFG", name: "Drawing for Games", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "3DCA", name: "3D Character Animation", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "VEN", name: "Virtual Environment", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "EGD", name: "Experimental Game Design", credit_point: 3, level:
    "graduate").save
  uni.units.new(code: "IGD", name: "Introduction to Game Design", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DI1", name: "Design Identity 1", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DI2", name: "Design Identity 2", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DI3", name: "Design Identity 3", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "NCF", name: "Negotiated Concept for Fashion 1", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "NCF2", name: "Negotiated Concept for Fashion 2", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "PDN", name: "Publication Design", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "PDN2", name: "Publication Design 2", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "NMP", name: "Network Media Production", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "CMP", name: "Cross Media Production", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "WDP", name: "Web Design and Production", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "TSJ", name: "The Sports Journalist (Ethical, Lawful and Professional)", credit_point: 3, level: "graduate").save

  uni.units.new(code: "SBG", name: "Sports Broadcasting (Live and Exclusive)", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "VL", name: "Video Live", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "DJR", name: "Data Journalisam", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "VRT", name: "Visual Representation Techniques", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "MAP", name: "Media Analysis and Planning", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "MCS", name: "Marketing Communications Strategy", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "MBR", name: "Managing Brands", credit_point: 3, level:
    "graduate").save
  uni.units.new(code: "FMC", name: "Foundations of Marketing Communication", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "MFD", name: "Marketing Fundamentals", credit_point: 3, level:
    "graduate").save

  uni.units.new(code: "EDV", name: "Event Development", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IET", name: "Introduction to Events and Tourisam", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TPL", name: "Tourism Policy", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TWE", name: "Tourism and World Economy", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "DMF", name: "Digital Media Fundamentals", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PCC", name: "Producing Credible Communication", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "EAU", name: "Engaging Audience", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "GDTR", name: "Graphic Design Thinking and Research", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IGDP", name: "Introduction to Graphic Design Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "MGS", name: "Motion Graphics", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ISY", name: "Identity Systems", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IGS", name: "Information Graphics", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PEG", name: "Packaging and Environmental Graphics", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TAL", name: "Typography and Layout", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "SPM", name: "Strategic Project Management", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "OCS", name: "Organisational Communication", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PAP", name: "Pixels and Polygons", credit_point: 3, level:
    "graduate").save
  uni.units.new( code: "CDA", name: "Character Design and Animation", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "RTE", name: "Real Time Environments", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "WDP", name: "Web Design and Production", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IBS", name: "Illuminated Bits", credit_point: 3, level:  "graduate").save

  uni.units.new( code: "IDTT", name: "Introduction to Design Thinking Techniques", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "WDP", name: "Web Design and Production", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "BET", name: "Built Environment Technology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "BDM", name: "Business Decision Making", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IIT", name: "Introduction to Interaction Design", credit_point: 3, level:
    "graduate").save


  uni.units.new( code: "CRP", name: "Creative Practice 1", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CRP2", name: "Creative Practice 2", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CAC", name: "Creative and Culture: Truth and Ideation", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "AFT", name: "Applied Fashion Techonology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "NCF", name: "Negotiated Concept for Fashion 1", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "NCF2", name: "Negotiated Concept for Fashion 2", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "DIY", name: "Design Identity 1", credit_point: 3, level: "graduate").save

  uni.units.new( code: "DIY2", name: "Design Identity 2", credit_point: 3, level: "graduate").save

  uni.units.new( code: "DCN", name: "Design Contextualisation 1", credit_point: 3, level: "graduate").save

  uni.units.new( code: "DCN2", name: "Design Contextualisation 2", credit_point: 3, level: "graduate").save

  uni.units.new( code: "CPR", name: "Critical Performance", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PMG", name: "Performance Making", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "THT", name: "Theatre History and Theory", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IPS", name: "Introduction to Performance Skills", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TDG", name: "Theatre Directing", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "MKS", name: "Musical Skills", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "SAP", name: "Systemic Anatomy and Physiology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IOS", name: "Introduction of Statistics", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "RAP", name: "Regional Anatomy and Physiology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "RPP", name: "Research and Professional Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "SEP", name: "Sport and Exercise Psychology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "POH", name: "Professional Orientation (Health)", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "UPB", name: "Understanding People and Behaviour", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "THT", name: "Theatre History and Theory", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PMP", name: "Pharmacy Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "DSP", name: "Dispensary Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CPT", name: "Clinical Physiotherapy", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "EBP", name: "Evidence Based Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "SME", name: "Sports Medicine", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IDH", name: "Indigenous Health", credit_point: 3, level:
    "graduate").save
  uni.units.new( code: "SNT", name: "Sports Nutrition", credit_point: 3, level:
    "graduate").save


  uni.units.new( code: "ITH", name: "Introduction to Health", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "HPPP", name: "Health Promotion Principles and Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "HPB", name: "Health Psychology and Behaviour", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CLG", name: "Clinical Governance", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "INC", name: "Integrating Nursing Concept", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "HAL", name: "Health Across the Lifespan: Mental Health", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CIP", name: "Concepts in Pharmacology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CAP", name: "Concepts in Pathophysiology", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TUS", name: "Therapeutic Use of Self", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CPM", name: "Construction Project Management", credit_point: 3, level:
"graduate").save

uni.units.new( code: "IEM", name: "Introduction to Estimating and Measurement", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CPU", name: "Construction Procurement", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IBEM", name: "Introduction to Built Environment Management", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ADE", name: "Advanced Digital Environment", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "EFM", name: "Engineering Fundamentals", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ESY", name: "Engineering Surveying", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "GEO", name: "Geoscience", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CDD", name: "Civil Design and Drafting", credit_point: 3, level: "graduate").save
  uni.units.new( code: "MUE", name: "Municipal Engineering", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "EEE", name: "Environmental Engineering", credit_point: 3, level:
    "graduate").save



  uni.units.new( code: "ITE", name: "Introduction to Economics", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "DMVE", name: "Destination Management and Visitor Economy", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ETM", name: "Event and Tourism Management", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "EMT", name: "Event Management", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "MFS", name: "Marketing Fundamentals", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "IET", name: "Introduction to Events and Tourism", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "TAC", name: "Tourism and Communication", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CTI", name: "Contemporary Tourism Issues", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "RTD", name: "Regional Tourism Development", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "STM", name: "Strategic Tourism Management", credit_point: 3, level:
    "graduate").save


  uni.units.new( code: "QMC", name: "Quantitative Methods in Commerce", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "PEC", name: "Professional Evidence Commerce", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "BGL", name: "BGL Internship (Commerce)", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "BGLM", name: "BGL Internship (Business and Management)", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "BGLP", name: "BGL Internship (Government and Policy)", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "SENT", name: "Social Enterprise", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "AIP", name: "Accounting Internship Preparation", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ASP", name: "Accounting System and Practice", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "MGA", name: "Management Accounting", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CRA", name: "Corporate Accounting", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "ADT", name: "Auditing", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "CIAG", name: "Contemporary Issue in Accounting", credit_point: 3, level:
    "graduate").save

  uni.units.new( code: "RVL", name: "Revenue Law", credit_point: 3, level:
    "graduate").save


  #Create multiple course_unit
  # category = [optional, mendatory]
  course = Course.find_by(code: 'MIT001')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CNS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ECC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save

  course = Course.find_by(code: 'MITS002')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CNS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ECC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save
  course.course_units.new(unit_id: Unit.find_by(code: "SNA").id, category: 'optional').save

  course = Course.find_by(code: 'BITS001')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save


  course = Course.find_by(code: 'BIT002')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save


  course = Course.find_by(code: 'BBI003')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save


  course = Course.find_by(code: 'BSEP163')
  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TEM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'optional').save
  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'optional').save

  course = Course.find_by(code: 'MDS005')
  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DDN").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save

  course = Course.find_by(code: 'MOE0113')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TEM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'optional').save


  course = Course.find_by(code: 'BCM121')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SBG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "VL").id, category: 'optional').save

  course = Course.find_by(code: 'MCM123')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save
  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

  course = Course.find_by(code: 'BVCD125')
  course.course_units.new(unit_id: Unit.find_by(code: "VRT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'optional').save

  course = Course.find_by(code: 'MPC126')
  course.course_units.new(unit_id: Unit.find_by(code: "VRT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "FMC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'optional').save


  course = Course.find_by(code: 'BCBM129')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'optional').save

  course = Course.find_by(code: 'BETM131')
  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IET").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TPL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TWE").id, category: 'optional').save


  course = Course.find_by(code: 'MAT132')

  course.course_units.new(unit_id: Unit.find_by(code: "IET").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TPL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TWE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CTI").id, category: 'optional').save



  course = Course.find_by(code: 'MAE141')
  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPU").id, category: 'optional').save


  course = Course.find_by(code: 'BOE142')
  course.course_units.new(unit_id: Unit.find_by(code: "EFM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'mendatory').save




  course = Course.find_by(code: 'BCET145')
  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPM").id, category: 'optional').save


  course = Course.find_by(code: 'BHS151')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save


  course = Course.find_by(code: 'BHHM152')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save


  course = Course.find_by(code: 'BHSN153')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'MPH154')
  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save


  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'mendatory').save
  course = Course.find_by(code: 'BIN155')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "INC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save


  course = Course.find_by(code: 'BOMW157')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "INC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save


  course = Course.find_by(code: 'BOP156')
  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'BOPY158')
  course.course_units.new(unit_id: Unit.find_by(code: "PMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DSP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'MOP159')
  course.course_units.new(unit_id: Unit.find_by(code: "TUS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HAL").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save


  course = Course.find_by(code: 'DOH160')
  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save



  course = Course.find_by(code: 'BSEC161')
  course.course_units.new(unit_id: Unit.find_by(code: "CAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SME").id, category: 'optional').save


  course = Course.find_by(code: 'BEPR162')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SME").id, category: 'optional').save


  course = Course.find_by(code: 'MSM165')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save


  course = Course.find_by(code: 'MSM169')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save


  course = Course.find_by(code: 'SMSM168')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save


  course = Course.find_by(code: 'BCI171')
  course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'optional').save


  course = Course.find_by(code: 'SMAF172')
  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "AFT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DCN").id, category: 'optional').save


  course = Course.find_by(code: 'MAFT173')
  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "AFT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DCN").id, category: 'optional').save


  course = Course.find_by(code: 'BCID175')
  course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PMG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "THT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'optional').save


  course = Course.find_by(code: 'SMDP177')
  course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PMG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "THT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'optional').save


  course = Course.find_by(code: 'MCM176')
course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'optional').save


course = Course.find_by(code: 'MIM181')
  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "RTE").id, category: 'optional').save


  course = Course.find_by(code: 'MGD183')
course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save


course = Course.find_by(code: 'MGDS184')
  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save


  course = Course.find_by(code: 'SMGD189')
course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "ARTP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "IGP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "3DG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "DFG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "3DCA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "VEN").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "EGD").id, category: 'optional').save


course = Course.find_by(code: 'BOD186')
course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "DI3").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save


course = Course.find_by(code: 'DID185')
course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "DI3").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "PAP").id, category: 'optional').save

course = Course.find_by(code: 'MAC001')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "RVL").id, category: 'optional').save

course = Course.find_by(code: 'BOA002')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save


course = Course.find_by(code: 'BOC003')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save


course = Course.find_by(code: 'GDA011')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save



course = Course.find_by(code: 'GCA012')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save
course = Course.find_by(code: 'MOPA0013')
course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save


course = Course.find_by(code: 'MIA014')
course.course_units.new(unit_id: Unit.find_by(code: "ASP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save


course = Course.find_by(code: 'CMCA015')
course.course_units.new(unit_id: Unit.find_by(code: "BGL").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "ASP").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'mendatory').save

course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

course.course_units.new(unit_id: Unit.find_by(code: "RVL").id, category: 'optional').save


  #Student Creation
  # Create Alteast 10 Students
  User.new(email: 'dal@uni.canberra.edu.au', role: 'student', password: 'Selise88',
    profile_attributes: {firstname: 'Dal',  middlename: 'Bdr', lastname: 'Rai'},
    address_attributes: {street_no: '4', street_name: 'Pollock St', suburb: 'Chifley', post_code: '2606',
    city: 'ACT', country: 'Australia'}).save


  User.new(email: 'prabhu@uni.canberra.edu.au', role: 'student', password: 'Gstbw33',
    profile_attributes: {firstname: 'Prabhu',  middlename: 'Dhan', lastname: 'Gurung'},
    address_attributes: {street_no: '41', street_name: 'Blakeley Way', suburb: 'Coombs', post_code: '2611',
    city: 'ACT', country: 'Australia'}).save

  User.new(email: 'john@uni.canberra.edu.au', role: 'student', password: 'Nhoj2021',
    profile_attributes: {firstname: 'John',  middlename: 'Van', lastname: 'Woodcock'},
    address_attributes: {street_no: '8', street_name: 'Dutton St', suburb: 'Dickson', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'umar@uni.canberra.edu.au', role: 'student', password: 'Raum99',
    profile_attributes: {firstname: 'Umar',  middlename: 'Shah', lastname: 'Jahn'},
    address_attributes: {street_no: '108', street_name: 'Davenport  St', suburb: 'Dickson', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'mark@uni.canberra.edu.au', role: 'student', password: 'atbet43',
    profile_attributes: {firstname: 'Mark',  middlename: 'Carif', lastname: 'Sebastain'},
    address_attributes: {street_no: '24', street_name: 'Parkin St', suburb: 'Torrens', post_code: '2607',
      city: 'ACT', country: 'Australia'}).save
  User.new(email: 'dipesh@uni.canberra.edu.au', role: 'student', password: 'Hsep11',
    profile_attributes: {firstname: 'Dipesh',  middlename: 'Kumar', lastname: 'Shrestha'},
    address_attributes: {street_no: '5', street_name: 'Collbung St', suburb: 'Coombs', post_code: '2611',
    city: 'ACT', country: 'Australia'}).save

  User.new(email: 'namgay@uni.canberra.edu.au', role: 'student', password: 'Gaynam77',
    profile_attributes: {firstname: 'Namgay',  middlename: 'Dorji', lastname: 'Gyeltshen'},
    address_attributes: {street_no: '20', street_name: 'Fitcher St', suburb: 'Chifley', post_code: '2606',
    city: 'ACT', country: 'Australia'}).save

  User.new(email: 'kaka@uni.canberra.edu.au', role: 'student', password: 'Akaa1980',
      profile_attributes: {firstname: 'Kaka',  middlename: 'Sel', lastname: 'Kaka'},
      address_attributes: {street_no: '', street_name: 'Fairhall St', suburb: 'Wright', post_code: '2611',
        city: 'ACT', country: 'Australia'}).save

  User.new(email: 'dave@uni.canberra.edu.au', role: 'student', password: 'Ilthc022',
    profile_attributes: {firstname: 'Dave',  middlename: 'Russell', lastname: 'Ton'},
    address_attributes: {street_no: '59', street_name: 'Fetcher St', suburb: 'Curitns', post_code: '2609',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'jack@uni.canberra.edu.au', role: 'student', password: 'Kacj077',
    profile_attributes: {firstname: 'Jack',  middlename: 'Rod', lastname: 'Daniel'},
    address_attributes: {street_no: '17', street_name: 'Akuna St', suburb: 'Northborne', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'tony@uni.canberra.edu.au', role: 'student', password: 'Ynot2022',
    profile_attributes: {firstname: 'Tony',  middlename: 'Bright', lastname: 'Helfinger'},
    address_attributes: {street_no: '101', street_name: 'Allara St', suburb: 'Duffy', post_code: '2611',
    city: 'ACT', country: 'Australia'}).save

  User.student.each do |user|
    if user.english_competencies.empty?
      user.english_competencies.new(competency_type: "IELTS", overall_band: 7, speaking: 6.5, reading: 7, writing: 7,
        listening: 7).save
      user.english_competencies.new(competency_type: "PTE", overall_band: 8, speaking: 8, reading: 8, writing: 8,
        listening: 8).save
    end
  end
end

