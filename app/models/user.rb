require 'digest/sha1'
class User < ActiveRecord::Base
  belongs_to :group
  has_many :entries

  validates_presence_of     :login  
  validates_presence_of     :surname
  validates_presence_of     :name
  validates_uniqueness_of     :login  

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank

  def self.authenticate(login, password)
    user = self.find_by_login(login)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
         user = nil
      end
    end
    user
  end
  #list of all subtypes of project
  def self.avalible_subtypes
    ["Root","GroupAdministrator","SimpleUser"]
  end

  # 'password' is a virtual attribute
  def password
    @password
  end
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  private
  def password_non_blank
    errors.add_to_base("Missing password" ) if hashed_password.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
