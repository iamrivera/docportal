class Patient < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :first_name, presence: true
    belongs_to :doctor
end
