class Doctor < ActiveRecord::Base
    has_secure_password
    has_many :patients
end
