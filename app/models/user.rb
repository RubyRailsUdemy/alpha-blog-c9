class User < ApplicationRecord
  # Association to articles
  has_many :articles
  
  # Convert email to lower case before saving to the database
  before_save{ self.email = email.downcase }
  
  # Validates the presence of a username, that it is unique, and is atleast 3 characters and less than 25
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  
  # Validates Email is presence, Email is Unique, email is less than 105 characters, and that it is a valid email format xx@yy.zz          
  VALID_EMAIL_REGEX = /A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX }
end