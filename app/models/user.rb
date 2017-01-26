require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  include BCrypt

  property :id, Serial
  property :email, String, :format => :email_address, required: true
  property :password, BCryptHash, :length => 250
  attr_accessor :password_confirmation

  validates_confirmation_of :password
end
