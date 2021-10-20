class User < ApplicationRecord
    has_many :locations 
    has_many :comments
    has_many :categories, through: :locations 

    has_secure_password # give us access to authentication method, built-in validation for password or password comformation 
end

# has_secure_passord needs decyrption to work - go to Gemfile 