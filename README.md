
# docportal

Welcome to Doc Portal 2000! 
Doc Portal 2000! was created to simulate a basic web application that manages patients for healthcare offices. Both doctors and patients must register prior to using. The portal has low-level security features such as bcrypt. 

This was built with doctors in mind and thus the doctor has many patients and patients belong to doctors. Doctors have the highest level of access and edit rights. 

Appointment features are on the roadmap. 

# Development
Doc Portal 2000 was creating using the Corneal Gem. This provided an efficient manner for generating the project scaffold. More information regarding the Corneal Gem can be found here: https://github.com/thebrianemory/corneal 

# Structure 
|_ App
   |_ Controllers 
      |_ Application Controller 
      |_ Doctors
      |_ Patients
   |_ Models
      |_ Doctor
      |_ Patient
   |_ Views
      |_ Doctors
      |_ Patients 
      |_ Application Controller 

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/iamrivera/docportal.

# License
This is available as open source under the terms of the MIT License.
