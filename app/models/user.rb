class User < ApplicationRecord
has_and_belongs_to_many :schedules
has_many :schedules 

#necessary for bcrpyt and to link password to password_digest
has_secure_password

validates :email, presence: true, uniqueness: true
validates :name, presence: true

end
