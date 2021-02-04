class Doctor < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :first_name, presence: true
    has_many :patients
end




