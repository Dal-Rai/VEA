Package.transaction do
  Package.destroy_all

  Package.create([
    { id: 1, package_type: 'basic', payee: 'student', duration: 'monthly',  amount: 10 },
    { id: 2, package_type: 'basic', payee: 'student',  duration: 'quartly', amount: 25 },
    { id: 3, package_type: 'basic', payee: 'student',  duration: 'yearly', amount: 100 },

    { id: 4, package_type: 'premium', payee: 'student', duration: 'monthly',  amount: 15 },
    { id: 5, package_type: 'premium', payee: 'student',  duration: 'quartly', amount: 30 },
    { id: 6, package_type: 'premium', payee: 'student',  duration: 'yearly', amount: 120 },

    { id: 7, package_type: 'basic', payee: 'university', duration: 'monthly',  amount: 25 },
    { id: 8, package_type: 'basic', payee: 'university',  duration: 'quartly', amount: 60 },
    { id: 9, package_type: 'basic', payee: 'university',  duration: 'yearly', amount: 150 },

    { id: 10, package_type: 'premium', payee: 'university', duration: 'monthly',  amount: 30 },
    { id: 11, package_type: 'premium', payee: 'university',  duration: 'quartly', amount: 80 },
    { id: 12, package_type: 'premium', payee: 'university',  duration: 'yearly', amount: 200 }
  ])
end