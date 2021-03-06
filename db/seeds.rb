#Add seed data here. Remember to seed database with rake db:seed
anita = Doctor.new(first_name: "Anita", last_name: "Kahlo", email: "akahlo@docpoc.com", bio: "I am a doctor! See me cure!", specialty: "Musical Medicine", medical_school: "USC - Keck School of Medicine", residency: "USC - LA County", graduation_date: "1991", password: "seedbead19")
anita.save
barry = Patient.new(first_name: "Barry", last_name: "Sanders", email: "barrys@anders.com", password: "GoSoxs!", occupation: "Athlete", marital_status: "Divorced", birthday: "1999-01-03", doctor_id: anita.id)
barry.save
larry = Patient.new(first_name: "Larry", last_name: "Bulls", email: "larryb@ulls.com", password: "GoBulls!", occupation: "Athlete", marital_status: "Divorced", birthday: "1999-04-03", doctor_id: anita.id)
larry.save
puts "data loaded successfully" #quick way to tell if your data has loaded while developing