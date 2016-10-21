class User < ActiveRecord::Base
    has_secure_password validations: false
    
    
    validates :first_name, presence: true, uniqueness: false
    validates :last_name, presence: true, uniqueness: false
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, uniqueness: false
    validates :city, presence: true, uniqueness: false
end
