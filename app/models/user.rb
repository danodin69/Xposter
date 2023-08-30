#email and password_digest are :string
#password and password_confirmation are :string virtual

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: 
    { with: URI::MailTo::EMAIL_REGEXP,
        message: "Email Address Is Not Valid"
    }
    #I kinda like the idea of having blanks in passwords.. so i might remove this [line 12]
    validates :password, presence: true
end