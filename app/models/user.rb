class User < ActiveRecord::Base
    has_secure_password validations: false
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
    
    validates :first_name, presence: true, uniqueness: false, length: { maximum: 30 }
    validates :last_name, presence: true, uniqueness: false, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX,  on: :create }
    validates :password_digest, presence: true, uniqueness: false
    validates :city, presence: true, uniqueness: false, length: { maximum: 40 }

end
