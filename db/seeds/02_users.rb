User.transaction do
  User.destroy_all

  User.create([
    { id: 1, email: 'dal+uni_admin_uc@gmail.com', password: 'Selise88',  user_type: 'uni_admin', university_id:
     1 },
    { id: 2, email: 'dal+uni_admin_anu@gmail.com', password: 'Selise88',  user_type: 'uni_admin', university_id:
      2  },
    { id: 3, email: 'dal+uni_admin_cit@gmail.com', password: 'Selise88',  user_type: 'uni_admin', university_id:
      3 },

    { id: 4, email: 'dal+student@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 5, email: 'dal+student1@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 6, email: 'dal+student2@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 7, email: 'dal+student3@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 8, email: 'dal+student4@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 9, email: 'dal+student5@gmail.com', password: 'Selise88',  user_type: 'student' },
    { id: 10, email: 'dal+student6@gmail.com', password: 'Selise88',  user_type: 'student' }
  ])
end

Profile.transaction do
  Profile.destroy_all

  Profile.create([
    { id: 1, firstname: 'Dal', middlename: 'UC',  lastname: 'Rai', mobile_no: '567897890', user_id: 1 },
    { id: 2, firstname: 'Dal', middlename: 'ANU',  lastname: 'Rai', mobile_no: '56789788', user_id: 2 },
    { id: 3, firstname: 'Dal', middlename: 'CIT',  lastname: 'Rai', mobile_no: '567897888', user_id: 3 },

    { id: 4, firstname: 'Dal', middlename: 'B4',  lastname: 'Rai', mobile_no: '567897890', user_id: 4,
      passport_no: 'GU001' },
    { id: 5, firstname: 'Dal', middlename: 'B5',  lastname: 'Rai', mobile_no: '567897890', user_id: 5,
      passport_no: 'GU002' },
    { id: 6, firstname: 'Dal', middlename: 'B6',  lastname: 'Rai', mobile_no: '567897890', user_id: 6,
      passport_no: 'GU003' },
    { id: 7, firstname: 'Dal', middlename: 'B7',  lastname: 'Rai', mobile_no: '567897896', user_id: 7,
      passport_no: 'GU004' },
    { id: 8, firstname: 'Dal', middlename: 'B8',  lastname: 'Rai', mobile_no: '56789784', user_id: 8,
      passport_no: 'GU005' },
    { id: 9, firstname: 'Dal', middlename: 'B9',  lastname: 'Rai', mobile_no: '567897896', user_id: 9,
      passport_no: 'GU006' },
    { id: 10, firstname: 'Dal', middlename: 'B10',  lastname: 'Rai', mobile_no: '567897897', user_id: 10,
      passport_no: 'GU007' }
  ])
end

EnglishCompetency.transaction do
  EnglishCompetency.destroy_all

  EnglishCompetency.create([
    { id: 1, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 7, speaking: 7, reading: 7,
      writing: 7, listening: 7, competenciable_id: 4, competenciable_type: 'User' },
    { id: 2, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 8, speaking: 8, reading: 8,
      writing: 8, listening: 8, competenciable_id: 5, competenciable_type: 'User'},
    { id: 3, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 9, speaking: 9, reading: 9,
      writing: 9, listening: 9, competenciable_id: 6, competenciable_type: 'User' },
    { id: 4, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 7, speaking: 7, reading: 7,
      writing: 7, listening: 7 , competenciable_id: 7, competenciable_type: 'User'},
    { id: 5, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 7, speaking: 7, reading: 7,
      writing: 7, listening: 7, competenciable_id: 8, competenciable_type: 'User' },
    { id: 6, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 7, speaking: 7, reading: 7,
      writing: 7, listening: 7, competenciable_id: 9, competenciable_type: 'User' },
    { id: 7, competency_type: 'IELTS', expiry: '01-01-2023',  overall_band: 7, speaking: 7, reading: 7,
      writing: 7, listening: 7, competenciable_id: 10, competenciable_type: 'User' }
  ])
end

Experience.transaction do
  Experience.destroy_all

  Experience.create([
    { id: 1, job_type: 'Programmer', start: '01-01-2019',  end: '01-01-2020', company: 'Selise', user_id: 4},
    { id: 2, job_type: 'Programmer', start: '01-01-2018',  end: '01-01-2020', company: 'Selise', user_id: 5},
    { id: 3, job_type: 'Programmer', start: '01-01-2017',  end: '01-01-2020', company: 'Selise', user_id: 6},
    { id: 4, job_type: 'Programmer', start: '01-01-2016',  end: '01-01-2020', company: 'Selise', user_id: 7}
  ])
end

