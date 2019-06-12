class User < ApplicationRecord
has_and_belongs_to_many :classes_attending, class_name: 'Schedule'
has_many :classes_teaching, class_name: 'Schedule'

#necessary for bcrpyt and to link password to password_digest
has_secure_password

validates :email, presence: true, uniqueness: true
validates :name, presence: true
# validates :is_instructor, presence: true

end
