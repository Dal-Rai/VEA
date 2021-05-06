

User.transaction do
  #Change Value
  University.create(name: 'Australian Catholic University', weblink: 'https://www.acu.edu.au', campus: "ACT",
    semester_living_expenses: 5000)
  uni = University.find_by(name: 'Australian Catholic University')

  uni.build_focal_contact(firstname: 'Katherine', middlename: 'Will', lastname: 'Megan', email: 'katherine@uni.acu.edu
.au', phone_number: '+61-997-877-665').save

  uni.build_address(street_no: '223', street_name: 'Anthill St', suburb: 'Watson', post_code: '2602', city: 'Canberra', country: 'Australia').save

  #create multiple faculties based on above course category name, I have created one as an example
  uni.faculties.new(code: 'ACUACC101', name: 'Accounting', course_category_id: CourseCategory.find_by(name:
    'Accounting').id).save

  uni.faculties.new(code: 'ACUICT102', name: 'Information and Technology', course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  uni.faculties.new(code: 'ACUMAA103', name: 'Media and Advertising', course_category_id: CourseCategory.find_by(name:
    'Media and Advertising').id).save

  uni.faculties.new(code: 'ACUHAT104', name: 'Hospitality and Tourism', course_category_id: CourseCategory.find_by(name:
    'Hospitality and Tourism').id).save

  uni.faculties.new(code: 'ACUENG111', name: 'Engineering', course_category_id: CourseCategory.find_by(name:
    'Engineering').id).save

  uni.faculties.new(code: 'ACUHLT115', name: 'Health', course_category_id: CourseCategory.find_by(name: "Information Management").id).save

  uni.faculties.new(code: 'ACUEAS113', name: 'Entertainment and Sports', course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  uni.faculties.new(code: 'ACUBAF121', name: 'Beauty and Fashion', course_category_id: CourseCategory.find_by(name:
    'Beauty and Fashion').id).save

  uni.faculties.new(code: 'ACUGDM122', name: 'Graphic Design and Multimedia', course_category_id: CourseCategory
                                                                                                  .find_by(name: 'Graphic Design and Multimedia').id).save


  #create multiple users as uni_admins
  uni.users.new(email: 'Smith@uni.acu.edu.au', role: 'uni_admin', password: 'Bhucan99',
    faculty_id: Faculty.find_by(code: 'ACUACC101'), profile_attributes: {firstname: 'John',  middlename: 'Miguan',
      lastname: 'Morgan'}, faculty_id: Faculty.find_by(code: 'ACC101').id)

  uni.users.new(email: 'Kaka@uni.acu.edu.au', role: 'uni_admin', password: 'Buli2021',
    profile_attributes: {firstname: 'Kaka',  middlename: 'Drukpa',
      lastname: 'Wang'}, faculty_id: Faculty.find_by(code: 'ACUICT102').id)

  uni.users.new(email: 'Santosh@uni.acu.edu.au', role: 'uni_admin', password: 'Mangee2021',
    faculty_id: Faculty.find_by(code: 'ACUMAA103').id, profile_attributes: {firstname: 'Santosh',  middlename: 'Kumar', lastname:
      'Bali'})

  uni.users.new(email: 'Drew@uni.acu.edu.au', role: 'uni_admin', password: 'Tang2021',
    faculty_id: Faculty.find_by(code: 'ACUHAT104').id, profile_attributes: {firstname: 'Drew',  middlename: 'Anderson',
      lastname: 'Bee'})

  uni.users.new(email: 'Pradhan@uni.acu.edu.au', role: 'uni_admin', password: 'Dhup21',
    faculty_id: Faculty.find_by(code: 'ACUENG111').id, profile_attributes: {firstname: 'Krishna',  middlename: 'Pradhan',
      lastname: 'Gimiree'})

  uni.users.new(email: 'Chelsea@uni.acu.edu.au', role: 'uni_admin', password: 'Suup21',
    faculty_id: Faculty.find_by(code: 'ACUICT102').id, profile_attributes: {firstname: 'Chelsea',  middlename: 'Long',
      lastname: 'Smith'})

  uni.users.new(email: 'Praveen@uni.acu.edu.au', role: 'uni_admin', password: 'Kaal21',
    faculty_id: Faculty.find_by(code: 'ACUEAS113').id, profile_attributes: {firstname: 'Praveen',  middlename: 'Kumar',
      lastname: 'Ghaley'})

  uni.users.new(email: 'Loc@uni.acu.edu.au', role: 'uni_admin', password: 'Daal21',
    faculty_id: Faculty.find_by(code: 'ACUBAF121').id, profile_attributes: {firstname: 'Loc',  middlename: 'Sung',
      lastname: 'Chong'})

  uni.users.new(email: 'Zeena@uni.acu.edu.au', role: 'uni_admin', password: 'Gaal21',
    faculty_id: Faculty.find_by(code: 'ACUGDM122').id, profile_attributes: {firstname: 'Zeena',  middlename: 'Amang',
      lastname: 'Masour'})



  #Keep these 5 lines same
  uni.criteria_rules.new(criteria: "english", weightage: 25).save
  uni.criteria_rules.new(criteria: "experience", weightage: 15).save
  uni.criteria_rules.new(criteria: "country", weightage: 10).save
  uni.criteria_rules.new(criteria: "academic", weightage: 50).save
  uni.build_experience_criteria(related_experience: 10, unrelated_experience: 5).save


  #Create Multiple Records by using the code used above in faculties
  # rank: [high_school, diploma, graduate, post_graduate, phd]
  # duration is total semesters
  faculty = Faculty.find_by(code: 'ACUACC101')
  faculty.courses.new(code: "ACUMAC001", name: "Master in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUBOA002", name: "Bachelor of Accounting", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUBOC003", name: "Bachelor of Commerce", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUBOB004", name: "Bachelor Business", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUGDA011", name: "Graduate Diploma in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUGCA012", name: "Graduate Certificate in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUMOPA0013", name: "Master of Professional Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUMIA014", name: "Major in Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty.courses.new(code: "ACUCMCA015", name: "Core Major in Commerce and Accounting", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Accounting').id).save

  faculty = Faculty.find_by(code: 'ACUICT102')
  faculty.courses.new(code: "ACUMIT001", name: "Master of Information Technology", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUMITS002", name: "Master of Information Technology System", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUBITS001", name: "Bachelor in Information Technology System", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUBIT002", name: "Bachelor in Information Technology ", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUBBI003", name: "Bachelor in Business Informatics ", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUBIT002", name: "Bachelor in Software Engineering", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUMDS005", name: "Master of Data Science", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUBIT011", name: "Master of Business Informatics", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty.courses.new(code: "ACUMOE0113", name: "Master of Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Information and Technology').id).save

  faculty = Faculty.find_by(code: 'ACUMAA103')
  faculty.courses.new(code: "ACUBCM121", name: "Bachelor of Communication and Media", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUBOD122", name: "Bachelor of Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUMCM123", name: "Master of Communication and Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUBOA124", name: "Bachelor of Arts (Film production)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUBVCD125", name: "Bachelor of Visual Communication Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUMPC126", name: "Master in Political Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUMIC127", name: "Master in Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUDIC128", name: "Diploma in Communication", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save

  faculty.courses.new(code: "ACUBCBM129", name: "Bachelor of Communication and Media Marketing", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Media and Advertising').id).save


  faculty = Faculty.find_by(code: 'ACUHAT104')
  faculty.courses.new(code: "ACUBETM131", name: "Bachelor of Event and Tourism Management", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "ACUMAT132", name: "Master of Arts in Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "ACUBMEM133", name: "Breadth Major in Event and Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "ACUCMTM134", name: "Core Major in Event and Tourism Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save

  faculty.courses.new(code: "ACUBMEM135", name: "Breadth Major in Event and Tourism", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Hospitality and Tourism').id).save
  faculty = Faculty.find_by(code: 'ACUENG111')
  faculty.courses.new(code: "ACUMAE141", name: "Master of Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "ACUBOE142", name: "Bachelor of Engineering", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "ACUBLD143", name: "Bachelor of Landscape Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "ACUMECM144", name: "Minor in Engineering and Construction Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "ACUBCET145", name: "Bachelor of Civil Engineering Technology", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty.courses.new(code: "ACUMICE146", name: "Major in Civil Engineering", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Engineering').id).save

  faculty = Faculty.find_by(code: 'ACUHLT115')
  faculty.courses.new(code: "ACUBHS151", name: "Bachelor of Health Science", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: "Healthcare and Medical").id).save

  faculty.courses.new(code: "ACUBHHM152", name: "Bachelor of Health Science (Human Movement)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUBHSN153", name: "Bachelor of Health Science (Nutrition)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUMPH154", name: "Master of Public Health", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUBIN155", name: "Bachelor in Nursing", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUBOP156", name: "Bachelor of Physiotherapy", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUBOMW157", name: "Bachelor of Midwifery", duration: 4, rank:
    "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUBOPY158", name: "Bachelor of Pharmacy", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUMOP159", name: "Master of Physiotherapy", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save

  faculty.courses.new(code: "ACUDOH160", name: "Diploma of Health", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Healthcare and Medical').id).save


  faculty = Faculty.find_by(code: 'ACUEAS113')
  faculty.courses.new(code: "ACUBSEC161", name: "Bachelor of Sport and Exercise Science", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUBEPR162", name: "Bachelor of Exercise Physiology and Rehabilitation", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUBSEP163", name: "Bachelor of Secondary Education (Health and Physical Education)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUMHPE164", name: "Major in Health and Physical Education", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUMSM165", name: "Major in Sport Management", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUMSS166", name: "Major in Sport Science", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUMSB167", name: "Major in Sport Business", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUSMSM168", name: "Specialist Major in Sports Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty.courses.new(code: "ACUMSM169", name: "Major in Sports Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Entertainment and Sport').id).save

  faculty = Faculty.find_by(code: 'ACUBAF121')
  faculty.courses.new(code: "ACUBCI171", name: "Bachelor of Creative Industries", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUSMAF172", name: "Specialist Major in Applied Fashion", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUMAFT173", name: "Minor in Applied Fashion Technology", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUMDI174", name: "Major in Design Identity", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUBCID175", name: "Bachelor of Creative Industries (Drama & Performance)", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUMCM176", name: "Major in Contemporary Musicianship", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save

  faculty.courses.new(code: "ACUSMDP177", name: "Specialist Major in Drama and Performance", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Beauty and Fashion').id).save


  faculty = Faculty.find_by(code: 'ACUBAF121')
  faculty.courses.new(code: "ACUMIM181", name: "Major in Multimedia", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUBAD182", name: "Bachelor of Arts and Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUMGD183", name: "Major in Graphic Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUMGDS184", name: "Major in Graphic Design Studio", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUDID185", name: "Diploma in Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUBOD186", name: "Bachelor of Design", duration: 4, rank: "graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUBMDM187", name: "Breadth Major in Digital Media", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUMIDDP188", name: "Major in Digital Design and Production", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  faculty.courses.new(code: "ACUSMGD189", name: "Specialist Major in Game Design", duration: 4, rank: "post_graduate", course_category_id: CourseCategory.find_by(name: 'Graphic Design and Multimedia').id).save

  #Create Multiple Units
  # Unit.create(code: " PPIT", name: "Professional Practice in IT", credit_point: 3, level: "high_school", semester_fees: 4500)
  # 
  Course.all.each do |course|
    unless course.english_competencies.first.nil?
      course.english_competencies.new(competency_type: "IELTS", overall_band: 6.5, speaking: 6, reading: 6, writing: 6, listening: 6).save
      course.english_competencies.new(competency_type: "PTE", overall_band: 6.5, speaking: 6, reading: 6, writing: 6, listening: 6).save
    end
  end

  Course.graduate.each do |course|
    unless course.academic_eligibilities.first.nil?
      course.academic_eligibilities.new(eligibility_type: "High School", minimum_score: 60, code: "high_school").save
    end
  end
  # 
  # Course.post_graduate.each do |course|
  #   course.academic_eligibilities.new(eligibility_type: "High School", minimum_score: 60, code: "high_school").save
  #   course.academic_eligibilities.new(eligibility_type: "Under Graduate", minimum_score: 60, code: "graduate").save
  # end

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
  course = Course.find_by(code: 'ACUMIT001')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CNS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ECC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMITS002')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CNS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ECC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save
  course.course_units.new(unit_id: Unit.find_by(code: "SNA").id, category: 'optional').save

  course = Course.find_by(code: 'ACUBITS001')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBIT002')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBBI003')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBSEP163')
  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TEM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'optional').save
  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMDS005')
  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPQM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DDN").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITDS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SSIT").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMOE0113')
  course.course_units.new(unit_id: Unit.find_by(code: "DBMS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PPIT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IIT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITNE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TEM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAM").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBCM121')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SBG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "VL").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMCM123')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save
  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

  course = Course.find_by(code: 'ACUBVCD125')
  course.course_units.new(unit_id: Unit.find_by(code: "VRT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TSJ").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMPC126')
  course.course_units.new(unit_id: Unit.find_by(code: "VRT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "FMC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DJR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBCBM129')
  course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PDN2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "WDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MBR").id, category: 'optional').save

  course = Course.find_by(code: 'ACUBETM131')
  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IET").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TPL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TWE").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMAT132')

  course.course_units.new(unit_id: Unit.find_by(code: "IET").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MFD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EDV").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TPL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TWE").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CTI").id, category: 'optional').save



  course = Course.find_by(code: 'ACUMAE141')
  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPU").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBOE142')
  course.course_units.new(unit_id: Unit.find_by(code: "EFM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'mendatory').save




  course = Course.find_by(code: 'ACUBCET145')
  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SPM").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBHS151')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBHHM152')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBHSN153')
  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMPH154')
  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save


  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'mendatory').save
  course = Course.find_by(code: 'ACUBIN155')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "INC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBOMW157')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "INC").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBOP156')
  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBOPY158')
  course.course_units.new(unit_id: Unit.find_by(code: "PMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DSP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMOP159')
  course.course_units.new(unit_id: Unit.find_by(code: "TUS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HAL").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save


  course = Course.find_by(code: 'ACUDOH160')
  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ITH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPPP").id, category: 'optional').save



  course = Course.find_by(code: 'ACUBSEC161')
  course.course_units.new(unit_id: Unit.find_by(code: "CAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "HPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CLG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SME").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBEPR162')
  course.course_units.new(unit_id: Unit.find_by(code: "SAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RAP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "POH").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "EBP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SME").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMSM165')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMSM169')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SNT").id, category: 'optional').save


  course = Course.find_by(code: 'ACUSMSM168')
  course.course_units.new(unit_id: Unit.find_by(code: "IOS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RPP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SEP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "UPB").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IDH").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBCI171')
  course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'optional').save


  course = Course.find_by(code: 'ACUSMAF172')
  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "AFT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DCN").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMAFT173')
  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CAC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "AFT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "NCF2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DCN").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBCID175')
  course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PMG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "THT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUSMDP177')
  course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CPR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PMG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "THT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMCM176')
  course.course_units.new(unit_id: Unit.find_by(code: "IDTT").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "NMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CMP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MCS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IPS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "TDG").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMIM181')
  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PAP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "RTE").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMGD183')
  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMGDS184')
  course.course_units.new(unit_id: Unit.find_by(code: "GDTR").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGS").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ISY").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGS").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "TAL").id, category: 'optional').save


  course = Course.find_by(code: 'ACUSMGD189')
  course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "CDA").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ARTP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "3DG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DFG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "3DCA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "VEN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "EGD").id, category: 'optional').save


  course = Course.find_by(code: 'ACUBOD186')
  course.course_units.new(unit_id: Unit.find_by(code: "IGD").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI3").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'optional').save


  course = Course.find_by(code: 'ACUDID185')
  course.course_units.new(unit_id: Unit.find_by(code: "IGDP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI1").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI2").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "DI3").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PDN").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "DMF").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "PAP").id, category: 'optional').save

  course = Course.find_by(code: 'ACUMAC001')
  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RVL").id, category: 'optional').save

  course = Course.find_by(code: 'ACUBOA002')
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


  course = Course.find_by(code: 'ACUBOC003')
  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save


  course = Course.find_by(code: 'ACUGDA011')
  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save



  course = Course.find_by(code: 'ACUGCA012')
  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save
  course = Course.find_by(code: 'ACUMOPA0013')
  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "SENT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save


  course = Course.find_by(code: 'ACUMIA014')
  course.course_units.new(unit_id: Unit.find_by(code: "ASP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "QMC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "PEC").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLM").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "BGLP").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CRA").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'optional').save


  course = Course.find_by(code: 'ACUCMCA015')
  course.course_units.new(unit_id: Unit.find_by(code: "BGL").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "AIP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ASP").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "MGA").id, category: 'mendatory').save

  course.course_units.new(unit_id: Unit.find_by(code: "ADT").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "CIAG").id, category: 'optional').save

  course.course_units.new(unit_id: Unit.find_by(code: "RVL").id, category: 'optional').save


  #Student Creation
  # Create Alteast 10 Students
  User.new(email: 'Bhisnu@uni.acu.edu.au', role: 'student', password: 'Saal88',
    profile_attributes: {firstname: 'Bhisnu',  middlename: 'Kumar', lastname: 'Rai'},
    address_attributes: {street_no: '4', street_name: 'Pollock St', suburb: 'Chifley', post_code: '2606',
      city: 'ACT', country: 'Australia'}).save


  User.new(email: 'Walter@uni.acu.edu.au', role: 'student', password: 'Gaal33',
    profile_attributes: {firstname: 'Walter',  middlename: 'Dhan', lastname: 'Kumar'},
    address_attributes: {street_no: '41', street_name: 'Blakeley Way', suburb: 'Coombs', post_code: '2611',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Lee@uni.acu.edu.au', role: 'student', password: 'Naal22',
    profile_attributes: {firstname: 'Lee',  middlename: 'Wang', lastname: 'Goshing'},
    address_attributes: {street_no: '8', street_name: 'Dutton St', suburb: 'Dickson', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Bosh@uni.acu.edu.au', role: 'student', password: 'Raal99',
    profile_attributes: {firstname: 'Bosh',  middlename: 'Silver', lastname: 'Rai'},
    address_attributes: {street_no: '108', street_name: 'Davenport  St', suburb: 'Dickson', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Liam@uni.acu.edu.au', role: 'student', password: 'Faal43',
    profile_attributes: {firstname: 'Liam',  middlename: 'Clark', lastname: 'Patrick'},
    address_attributes: {street_no: '24', street_name: 'Parkin St', suburb: 'Torrens', post_code: '2607',
      city: 'ACT', country: 'Australia'}).save
  User.new(email: 'Tashi@uni.acu.edu.au', role: 'student', password: 'Haal11',
    profile_attributes: {firstname: 'Tashi',  middlename: 'Choden', lastname: 'Dorji'},
    address_attributes: {street_no: '5', street_name: 'Collbung St', suburb: 'Coombs', post_code: '2611',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Gidam@uni.acu.edu.au', role: 'student', password: 'Gaal77',
    profile_attributes: {firstname: 'Gidam',  middlename: 'Dorji', lastname: 'Gyan'},
    address_attributes: {street_no: '20', street_name: 'Fitcher St', suburb: 'Chifley', post_code: '2606',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Caca@uni.acu.edu.au', role: 'student', password: 'Daal80',
    profile_attributes: {firstname: 'Caca',  middlename: 'Bruce', lastname: 'Wangdi'},
    address_attributes: {street_no: '', street_name: 'Fairhall St', suburb: 'Wright', post_code: '2611',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Davis@uni.acu.edu.au', role: 'student', password: 'Laal22',
    profile_attributes: {firstname: 'Davis',  middlename: 'Russell', lastname: 'Cruise'},
    address_attributes: {street_no: '59', street_name: 'Fetcher St', suburb: 'Curitns', post_code: '2609',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Wangli@uni.acu.edu.au', role: 'student', password: 'Kacj077',
    profile_attributes: {firstname: 'Wangli',  middlename: 'Mill', lastname: 'Kong'},
    address_attributes: {street_no: '17', street_name: 'Akuna St', suburb: 'Northborne', post_code: '2602',
      city: 'ACT', country: 'Australia'}).save

  User.new(email: 'Jamyang@uni.acu.edu.au', role: 'student', password: 'Ynot2022',
    profile_attributes: {firstname: 'Jamyang',  middlename: 'Khandu', lastname: 'Dorji'},
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

