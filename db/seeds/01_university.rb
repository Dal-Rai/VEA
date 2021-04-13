# ActiveRecord::Base.connection.reset_pk_sequence!('english_competencies')

University.transaction do
  University.destroy_all

  University.create([
    { name: 'University of Canberra', weblink: 'https://canberra.edu.au', id: 1, remark: 'UC is located at Bruce Campus' },
    { name: 'Australian National University', weblink: 'https://www.anu.edu.au', id: 2, remark: 'ANU is located at heart of Canberra City' },
    { name: 'Canberra Institute of Technology', weblink: 'https://cit.edu.au', id: 3, remark: 'Adult education school at Reid' }
  ])
end

FocalContact.transaction do
  FocalContact.destroy_all

  FocalContact.create([
    { id: 1, email: 'dal+uni_admin_uc@gmail.com', firstname: 'Dal', middlename: 'UC',  lastname: 'Rai',
      phone_number: '567897890', university_id: 1 },
    { id: 2, email: 'dal+uni_admin_anu@gmail.com', firstname: 'Dal', middlename: 'ANU',  lastname: 'Rai',
      phone_number: '567897890', university_id: 2 },
    { id: 3, email: 'dal+uni_admin_cit@gmail.com', firstname: 'Dal', middlename: 'CIT',  lastname: 'Rai',
      phone_number: '567897890', university_id: 3},
  ])
end

CriteriaRule.transaction do
  CriteriaRule.destroy_all

  CriteriaRule.create([
    { id: 1, criteria: 'english', weightage: 25, university_id: 1 },
    { id: 2, criteria: 'experience', weightage: 15, university_id: 1 },
    { id: 3, criteria: 'academic', weightage: 50, university_id: 1 },
    { id: 4, criteria: 'country', weightage: 10, university_id: 1 }
  ])
end

