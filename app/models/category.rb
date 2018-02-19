class Category < ApplicationRecord
  # Validates the presence of a name, that it is unique, and is atleast 3 characters and less than 25
  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
end