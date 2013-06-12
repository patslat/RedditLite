require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :email, :username, :password
  has_many :submitted_links,
    class_name: 'Link',
    foreign_key: :submitter_id

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token
    self.session_token = SecureRandom.base64(16)
  end
end
